import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sree_balagi_gold/features/notification/data/i_notification_facade.dart';
import 'package:sree_balagi_gold/features/notification/data/model/notification_model.dart';
import 'package:sree_balagi_gold/general/core/failure/main_failure.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';
import 'package:sree_balagi_gold/general/utils/firebase_collection.dart';

@LazySingleton(as: INotificationFacade)
class INotificationImpl implements INotificationFacade {
  INotificationImpl(
    this.firestore,
  );

  final FirebaseFirestore firestore;

  QueryDocumentSnapshot<Map<String, dynamic>>? lastDoc;

  @override
  FutureResult<List<NotificationModel>> fetchNotification() async {
    try {
      final data = lastDoc == null
          ? await firestore
              .collection(FirebaseCollection.notifications)
              .orderBy('timestamp', descending: true)
              .limit(10)
              .get()
          : await firestore
              .collection(FirebaseCollection.notifications)
              .orderBy('timestamp', descending: true)
              .limit(10)
              .startAfterDocument(lastDoc!)
              .get();
      if (data.docs.isNotEmpty) {
        lastDoc = data.docs.last;

        return right(
          data.docs
              .map(
                (e) => NotificationModel.fromMap(
                  e.data(),
                ),
              )
              .toList(),
        );
      } else {
        return left(
          const MainFailure.noData(msg: 'No data fount'),
        );
      }
    } on FirebaseException catch (e) {
      return left(
        MainFailure.serverFailure(msg: e.code),
      );
    }
  }

  @override
  void clearData() {
    lastDoc = null;
  }
}
