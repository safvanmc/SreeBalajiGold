import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sree_balagi_gold/features/my_orders/data/i_order_facade.dart';
import 'package:sree_balagi_gold/features/my_orders/data/model/my_order_model.dart';
import 'package:sree_balagi_gold/general/core/failure/main_failure.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';
import 'package:sree_balagi_gold/general/utils/firebase_collection.dart';

@LazySingleton(as: IOrderFacade)
class IOrderImpl implements IOrderFacade {
  final FirebaseFirestore firestore;
  IOrderImpl(this.firestore);
  QueryDocumentSnapshot<Map<String, dynamic>>? lastDoc;
  bool isMoreData = false;
  @override
  FutureResult<List<MyOrderModel>> getOrders({required String userId}) async {
    try {
      final query = firestore
          .collection(FirebaseCollection.orders)
          .where('user.id', isEqualTo: userId)
          .orderBy('createdAt', descending: true);
      final data = lastDoc == null
          ? await query.limit(10).get()
          : await query.startAfterDocument(lastDoc!).get();

      if (data.docs.isNotEmpty) {
        lastDoc = data.docs.last;

        return right(
          data.docs
              .map(
                (e) => MyOrderModel.fromMap(
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
    } catch (e) {
      return left(MainFailure.serverFailure(msg: '$e'));
    }
  }

  @override
  void clearData() {
    lastDoc = null;
  }
}
