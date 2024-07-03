import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:sree_balagi_gold/features/auth/data/model/user_model.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/features/favorite/data/i_favorite_facade.dart';
import 'package:sree_balagi_gold/general/core/failure/main_failure.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';
import 'package:sree_balagi_gold/general/utils/firebase_collection.dart';

@LazySingleton(as: IFavoriteFacade)
class IFavoriteImpl implements IFavoriteFacade {
  IFavoriteImpl(
    this.firestore,
    this.firebaseAuth,
  );
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;

  @override
  FutureResult<Unit> addFavorite({
    required UserModel userModel,
    required ProductModel productModel,
  }) async {
    try {
      await firestore
          .collection(FirebaseCollection.users)
          .doc(userModel.id)
          .update({
        'favorites': FieldValue.arrayUnion(
          [productModel.id],
        ),
      });
      return right(unit);
    } on Exception catch (e) {
      return left(
        MainFailure.serverFailure(
          msg: e.toString(),
        ),
      );
    }
  }

  @override
  FutureResult<Unit> removeFavorite({
    required UserModel userModel,
    required ProductModel productModel,
  }) async {
    try {
      await firestore
          .collection(FirebaseCollection.users)
          .doc(userModel.id)
          .update({
        'favorites': FieldValue.arrayRemove(
          [productModel.id],
        ),
      });
      return right(unit);
    } on Exception catch (e) {
      return left(
        MainFailure.serverFailure(
          msg: e.toString(),
        ),
      );
    }
  }

  int currentIndex = 0;
  int currentLastIndex = 0;
  bool noMoreData = false;

  @override
  FutureResult<List<ProductModel>> fetchFavoriteProducts(
    List<String> productIds,
  ) async {
    if (noMoreData) return right([]);
    try {
      currentLastIndex += 5;
      List<Future<DocumentSnapshot<Map<String, dynamic>>>> futures = [];
      for (currentIndex; currentIndex < currentLastIndex; currentIndex++) {
        if (currentIndex < productIds.length) {
          futures.add(
            firestore
                .collection(FirebaseCollection.product)
                .doc(
                  productIds[currentIndex],
                )
                .get(),
          );
        } else {
          noMoreData = true;
        }
      }

      final queryDocs = await Future.wait(futures);
      List<ProductModel> productList = [];

      for (var element in queryDocs) {
        if (element.exists &&
            (element.data()?['users'] as List)
                .contains(firebaseAuth.currentUser?.uid)) {
          productList.add(
            ProductModel.fromMap(element.data() as Map<String, dynamic>)
                .copyWith(
              id: element.id,
            ),
          );
        }
      }

      return right(productList);
    } catch (ex) {
      return left(MainFailure.serverFailure(msg: ex.toString()));
    }
  }

  @override
  void clearData() {
    currentIndex = 0;
    currentLastIndex = 0;
    noMoreData = false;
  }
}
