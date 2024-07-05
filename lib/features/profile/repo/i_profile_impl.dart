import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:sree_balagi_gold/features/auth/data/model/user_model.dart';
import 'package:sree_balagi_gold/features/profile/data/i_profile_facade.dart';
import 'package:sree_balagi_gold/general/core/failure/main_failure.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';
import 'package:sree_balagi_gold/general/utils/firebase_collection.dart';

@LazySingleton(as: IProfileFacade)
class IProfileImpl implements IProfileFacade {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  IProfileImpl(this.firestore, this.firebaseAuth);
  @override
  FutureResult<Unit> updateProfile(UserModel userModel) async {
    try {
      log('doneee');
      await firestore
          .collection(FirebaseCollection.users)
          .doc(userModel.id)
          .update(userModel.updateMap());
      log('user updated successfully');

      return right(unit);
    } catch (e) {
      return left(
        MainFailure.serverFailure(
          msg: e.toString(),
        ),
      );
    }
  }
}
