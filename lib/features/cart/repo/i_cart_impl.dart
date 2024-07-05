import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sree_balagi_gold/features/auth/data/model/user_model.dart';
import 'package:sree_balagi_gold/features/cart/data/i_cart_facade.dart';
import 'package:sree_balagi_gold/features/cart/data/model/cart_model.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/general/core/failure/main_failure.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';
import 'package:sree_balagi_gold/general/utils/firebase_collection.dart';

@LazySingleton(as: ICartFacade)
class ICartImpl implements ICartFacade {
  final FirebaseFirestore firestore;
  ICartImpl(this.firestore);
  @override
  FutureResult<Unit> addToCart(
      ProductModel productModel, UserModel userModel) async {
    try {
      firestore.collection(FirebaseCollection.users).doc(userModel.id).update(
        {
          'cart.${productModel.id}': 1,
        },
      );

      return right(unit);
    } catch (e) {
      return left(MainFailure.serverFailure(msg: e.toString()));
    }
  }

  @override
  FutureResult<Unit> removeFromCart(
      String productId, UserModel userModel) async {
    try {
      firestore.collection(FirebaseCollection.users).doc(userModel.id).update(
        {'cart.$productId': FieldValue.delete()},
      );

      return right(unit);
    } catch (e) {
      return left(MainFailure.serverFailure(msg: e.toString()));
    }
  }

  @override
  FutureResult<List<CartModel>> fetchCratData(
      List<Map<String, dynamic>> productId) async {
    final List<CartModel> cartList = [];
    try {
      for (var element in productId) {
        final id = element.entries.first.key;
        final qty = element.entries.first.value as int;
        final data = await firestore
            .collection(FirebaseCollection.product)
            .doc(id)
            .get();
        if (data.exists) {
          final product = data.data();
          cartList.add(CartModel.fromMap(product!).copyWith(qty: qty));
        }
      }
      return right(cartList);
    } catch (e) {
      return left(
        MainFailure.serverFailure(
          msg: e.toString(),
        ),
      );
    }
  }

  @override
  FutureResult<Unit> addQty(CartModel model, UserModel userModel) async {
    try {
      await firestore
          .collection(FirebaseCollection.users)
          .doc(userModel.id)
          .update(
        {
          'cart.${model.id}': model.qty,
        },
      );

      return right(unit);
    } catch (e) {
      return left(MainFailure.serverFailure(msg: e.toString()));
    }
  }

  @override
  FutureResult<Unit> removeQty(CartModel model, UserModel userModel) async {
    try {
      await firestore
          .collection(FirebaseCollection.users)
          .doc(userModel.id)
          .update(
        {
          'cart.${model.id}': model.qty,
        },
      );

      return right(unit);
    } catch (e) {
      return left(MainFailure.serverFailure(msg: e.toString()));
    }
  }
}
