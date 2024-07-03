import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sree_balagi_gold/features/sub_category/data/i_sub_category_facade.dart';
import 'package:sree_balagi_gold/features/sub_category/data/model/sub_category_model.dart';
import 'package:sree_balagi_gold/general/core/failure/main_failure.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';
import 'package:sree_balagi_gold/general/utils/firebase_collection.dart';

@LazySingleton(as: ISubCategoryFacade)
class ISubCategoryImpl implements ISubCategoryFacade {
  ISubCategoryImpl(
    this.firestore,
  );

  final FirebaseFirestore firestore;

  QueryDocumentSnapshot<Map<String, dynamic>>? lastDoc;

  @override
  FutureResult<List<SubCategoryModel>> fetchSubCategory({
    required String userID,
    required String mainCategoryID,
  }) async {
    try {
      final data = lastDoc == null
          ? await firestore
              .collection(FirebaseCollection.subCategory)
              .where('mainCategoryId', isEqualTo: mainCategoryID)
              .where('users', arrayContains: userID)
              .orderBy('createdAt', descending: true)
              .limit(10)
              .get()
          : await firestore
              .collection(FirebaseCollection.subCategory)
              .where('mainCategoryId', isEqualTo: mainCategoryID)
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
                (e) => SubCategoryModel.fromMap(
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
