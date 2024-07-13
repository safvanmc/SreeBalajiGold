import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:sree_balagi_gold/features/auth/data/i_auth_facade.dart';
import 'package:sree_balagi_gold/features/auth/data/model/user_model.dart';
import 'package:sree_balagi_gold/general/core/failure/main_failure.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';
import 'package:sree_balagi_gold/general/utils/app_details.dart';
import 'package:sree_balagi_gold/general/utils/firebase_collection.dart';

@LazySingleton(as: IAuthFacade)
class IAuthImpl implements IAuthFacade {
  IAuthImpl(
    this.firebaseAuth,
    this.firestore,
    this.firebaseMessaging,
  );
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final FirebaseMessaging firebaseMessaging;
  int? resendToken;
  String? verificationId;

  @override
  StreamResult veryfyPhoneNumber({
    required bool isRegister,
    required String phoneNumber,
  }) async* {
    final controller = StreamController<Either<MainFailure, bool>>();

    try {
      final isExist = await _isExistUserDoc(phoneNumber);
      if (isRegister) {
        if (isExist) {
          controller.add(
            left(
              const MainFailure.serverFailure(
                msg: 'User already registered. Please sign in',
              ),
            ),
          );
          // await controller.close();
          yield* controller.stream;
          return;
        }
      } else {
        if (!isExist) {
          controller.add(
            left(
              const MainFailure.serverFailure(
                msg: 'User not exist. Please register first.',
              ),
            ),
          );
          // await controller.close();
          yield* controller.stream;
          return;
        }
      }

      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: '${AppDetails.countryCode}$phoneNumber',
        forceResendingToken: resendToken,
        verificationCompleted: (PhoneAuthCredential credential) {
          // Handle auto-verification (optional)
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            controller.add(
              left(
                const MainFailure.authFailure(
                  msg: 'The provided phone number is not valid',
                ),
              ),
            );
          } else {
            controller.add(
              left(
                MainFailure.authFailure(
                  msg: e.code,
                ),
              ),
            );
          }
          controller.close();
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId = verificationId;
          this.resendToken = resendToken;
          controller.add(
            right(true),
          );
          controller.close();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle timeout (optional)
        },
      );

      yield* controller.stream;
    } catch (e) {
      controller.add(
        left(
          MainFailure.serverFailure(
            msg: 'Unexpected error occurred: $e',
          ),
        ),
      );
      await controller.close();
      yield* controller.stream;
    }
  }

  @override
  FutureResult<Unit> veryfyOtp({
    required String otp,
    required UserModel userModel,
  }) async {
    if (verificationId == null) {
      return left(
        const MainFailure.authFailure(
          msg: 'Verification id is null',
        ),
      );
    }
    try {
      // VERIFY OTP
      final verifyOtpResult = await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verificationId!,
          smsCode: otp,
        ),
      );
      // CHECK USER IS NULL
      if (verifyOtpResult.user?.uid == null) {
        return left(const MainFailure.authFailure(msg: 'User is null'));
      }
      bool? isExistingUser;
      final existingResult = await _isUserExists(
        verifyOtpResult.user!.uid,
      );
      existingResult.fold(
        (l) {
          throw Exception(l.msg);
        },
        (isExist) async {
          isExistingUser = isExist;
        },
      );

      if (isExistingUser == null) {
        return left(
          const MainFailure.noData(
            msg: 'isExistingUser Please try again',
          ),
        );
      }

      if (isExistingUser!) {
        final result = await updatedUset();
        return result.fold(
          left,
          (r) {
            return right(unit);
          },
        );
      } else {
        final result = await createUser(userModel);
        return result.fold(
          left,
          (r) {
            return right(unit);
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        return left(
          const MainFailure.authFailure(
            msg: 'The provided sms code is not valid',
          ),
        );
      } else {
        return left(
          MainFailure.authFailure(
            msg: e.code,
          ),
        );
      }
    } catch (e) {
      return left(
        MainFailure.authFailure(
          msg: e.toString(),
        ),
      );
    }
  }

  FutureResult<bool> _isUserExists(String uid) async {
    try {
      final user =
          await firestore.collection(FirebaseCollection.users).doc(uid).get();

      if (user.exists) {
        return right(true);
      } else {
        return right(false);
      }
    } on Exception catch (e) {
      return left(
        MainFailure.authFailure(
          msg: e.toString(),
        ),
      );
    }
  }

  FutureResult<Unit> createUser(
    UserModel userModel,
  ) async {
    await firebaseMessaging.subscribeToTopic(AppDetails.fcmTopic);
    final fcmToken = await firebaseMessaging.getToken();

    // CREATE USER
    try {
      final userId = firebaseAuth.currentUser?.uid;
      final batch = firestore.batch();
      // CREATE USER
      batch.set(
        firestore.collection(FirebaseCollection.users).doc(userId),
        userModel
            .copyWith(
              id: userId,
              fcmToken: fcmToken,
            )
            .toMapCreateUser(),
      );

      // totalUserCount
      batch.update(
        firestore.collection(FirebaseCollection.general).doc('general'),
        {
          'totalUserCount': FieldValue.increment(1),
          (Platform.isIOS ? 'totalUserCount_IOS' : 'totalUserCount_ANDROID'):
              FieldValue.increment(1),
        },
      );

      await batch.commit();

      return right(unit);
    } on Exception catch (e) {
      return left(
        MainFailure.authFailure(
          msg: e.toString(),
        ),
      );
    }
  }

  FutureResult<Unit> updatedUset() async {
    // CHECK PHONE NUMBER
    final uid = firebaseAuth.currentUser?.uid;
    if (uid == null) {
      return left(
        const MainFailure.userFailure(
          msg: 'uid is null',
        ),
      );
    }
    try {
      await firebaseMessaging.subscribeToTopic(AppDetails.fcmTopic);
      final fcmToken = await firebaseMessaging.getToken();
      // UPDATE USER [updatedAt] TIMESTAMP AND FCM TOKEN
      await firestore.collection(FirebaseCollection.users).doc(uid).update(
        {
          'updatedAt': FieldValue.serverTimestamp(),
          'fcmToken': fcmToken,
        },
      );
      return right(unit);
    } on Exception catch (e) {
      return left(
        MainFailure.userFailure(
          msg: e.toString(),
        ),
      );
    }
  }

  Future<bool> _isExistUserDoc(String phoneNumber) {
    return firestore
        .collection(FirebaseCollection.users)
        .where('phoneNumber',
            isEqualTo: '${AppDetails.countryCode}$phoneNumber')
        .get()
        .then((value) => value.docs.isNotEmpty);
  }

  @override
  void clearData() {
    verificationId = null;
    resendToken = null;
  }

  @override
  Stream<UserModel?> fetchUser() async* {
    final userId = firebaseAuth.currentUser?.uid;
    if (userId == null) {
      yield null;
      return;
    }

    final snapshot =
        firestore.collection(FirebaseCollection.users).doc(userId).snapshots();

    final user = snapshot.map((event) {
      if (event.exists) {
        return UserModel.fromMap(event.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    });
    yield* user;
  }

  @override
  FutureResult<Unit> setLastAppOpenTime() async {
    try {
      final userId = firebaseAuth.currentUser?.uid;
      if (userId == null) {
        log('User not found');
        return left(
          const MainFailure.noData(msg: 'User not found'),
        );
      }

      await firestore.collection(FirebaseCollection.users).doc(userId).update({
        'lastEntryTime': FieldValue.serverTimestamp(),
      });
      return right(unit);
    } catch (e) {
      return left(
        MainFailure.serverFailure(
          msg: e.toString(),
        ),
      );
    }
  }

  @override
  FutureResult<Unit> logOut() async {
    try {
      log(firebaseAuth.currentUser!.uid);
      await firebaseAuth.signOut();
      log('${firebaseAuth.currentUser?.uid}');
      return right(unit);
    } catch (e) {
      return left(MainFailure.authFailure(msg: '$e'));
    }
  }

  @override
  FutureResult<Unit> deleteAccount() async {
    try {
      final docId = firebaseAuth.currentUser?.uid;
      await firestore.collection(FirebaseCollection.users).doc(docId).delete();
      await firebaseAuth.signOut();
      await firebaseMessaging.unsubscribeFromTopic('all');
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(
        MainFailure.authFailure(
          msg: e.message ?? "Failed to LogOut",
        ),
      );
    }
  }

  @override
  FutureResult<Unit> addScreeenShotRemark(UserModel model) async {
    try {
      await firestore
          .collection(FirebaseCollection.users)
          .doc(model.id)
          .update({
        'isBlocked': true,
        'blockReason':
            'Your account has been blocked due to a violation of our terms of service regarding screenshots. Please contact support for further assistance.'
      });
      return right(unit);
    } catch (e) {
      return left(MainFailure.serverFailure(msg: '$e'));
    }
  }
}
