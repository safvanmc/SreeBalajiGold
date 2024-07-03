import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/i_category_product_facade.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/general/core/failure/main_failure.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';
import 'package:sree_balagi_gold/general/utils/firebase_collection.dart';

@LazySingleton(as: ICategoryProductFacade)
class ICategoryProductImpl implements ICategoryProductFacade {
  ICategoryProductImpl(
    this.firestore,
  );

  final FirebaseFirestore firestore;

  QueryDocumentSnapshot<Map<String, dynamic>>? lastDoc;

  @override
  FutureResult<List<ProductModel>> fetchCategoryProduct({
    required String userID,
    required String subCategoryid,
  }) async {
    try {
      final data = lastDoc == null
          ? await firestore
              .collection(FirebaseCollection.product)
              .where('subCategoryId', isEqualTo: subCategoryid)
              .where('users', arrayContains: userID)
              .orderBy('createdAt', descending: true)
              .limit(10)
              .get()
          : await firestore
              .collection(FirebaseCollection.product)
              .where('subCategoryId', isEqualTo: subCategoryid)
              .where('users', arrayContains: userID)
              .orderBy('createdAt', descending: true)
              .limit(10)
              .startAfterDocument(lastDoc!)
              .get();
      if (data.docs.isNotEmpty) {
        lastDoc = data.docs.last;

        return right(
          data.docs
              .map(
                (e) => ProductModel.fromMap(
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
