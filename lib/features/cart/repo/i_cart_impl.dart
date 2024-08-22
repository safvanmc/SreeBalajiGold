import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:sree_balagi_gold/features/auth/data/model/user_model.dart';
import 'package:sree_balagi_gold/features/cart/data/i_cart_facade.dart';
import 'package:sree_balagi_gold/features/cart/data/model/cart_model.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/features/my_orders/data/model/my_order_model.dart';
import 'package:sree_balagi_gold/general/core/failure/main_failure.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';
import 'package:sree_balagi_gold/general/service/network_time.dart';
import 'package:sree_balagi_gold/general/utils/firebase_collection.dart';

@LazySingleton(as: ICartFacade)
class ICartImpl implements ICartFacade {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  ICartImpl(this.firestore, this.firebaseAuth);
  @override
  FutureResult<Unit> addToCart(
    ProductModel productModel,
    UserModel userModel,
  ) async {
    try {
      final createdAt = await getNetworkTime();
      firestore.collection(FirebaseCollection.users).doc(userModel.id).update(
        {
          'cart.${productModel.id}.${'qty'}': 1,
          'cart.${productModel.id}.createdAt': Timestamp.fromDate(createdAt),
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
  FutureResult<List<CartModel>> fetchCartData(
      List<Map<String, dynamic>> productId) async {
    final List<CartModel> cartList = [];
    try {
      // Collect all the Future objects in a list
      final List<Future<void>> futures = [];

      for (var element in productId) {
        futures.add(
          Future(() async {
            final id = element.entries.first.key;
            final qty = element[id]['qty'];
            final remark = element[id]['remarks'];
            final createdAt = element[id]['createdAt'];

            final data = await firestore
                .collection(FirebaseCollection.product)
                .doc(id)
                .get();

            if (data.exists) {
              final product = data.data();
              cartList.add(CartModel.fromMap(product!).copyWith(
                qty: qty,
                remark: remark,
                createdAt: createdAt,
              ));
            }
          }),
        );
      }

      // Wait for all futures to complete
      await Future.wait(futures);

      cartList.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

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
  FutureResult<Unit> addQty(
    CartModel model,
    UserModel userModel,
  ) async {
    try {
      await firestore
          .collection(FirebaseCollection.users)
          .doc(userModel.id)
          .update(
        {
          'cart.${model.id}.${'qty'}': model.qty,
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
          'cart.${model.id}.${'qty'}': model.qty,
        },
      );

      return right(unit);
    } catch (e) {
      return left(MainFailure.serverFailure(msg: e.toString()));
    }
  }

  //add and remove remark//

  @override
  FutureResult<Unit> changeRemark(CartModel model, UserModel userModel) async {
    try {
      await firestore
          .collection(FirebaseCollection.users)
          .doc(userModel.id)
          .update(
        {
          'cart.${model.id}.${'remarks'}': model.remark,
        },
      );

      return right(unit);
    } catch (e) {
      return left(MainFailure.serverFailure(msg: e.toString()));
    }
  }

  @override
  FutureResult<Unit> placeOrder(
    UserModel userModel,
    List<CartModel> cartList,
  ) async {
    try {
      final batch = firestore.batch();

      for (var cartproduct in cartList) {
        for (var i = 0; i < (cartproduct.qty ?? 1); i++) {
          final id = firestore.collection(FirebaseCollection.orders).doc().id;

          ///
          ///
          ///
          final orderModel = OrderModel(
            remark: cartproduct.remark,
            isPurchase: false,
            isUser: true,
            product: ProductModel(
              productUrl: cartproduct.productUrl,
              serialNumber: cartproduct.serialNumber,
              grossWeight: cartproduct.grossWeight,
              netWeight: cartproduct.netWeight,
              pieces: cartproduct.pieces,
              materials: cartproduct.materials,
              mainCategoryId: cartproduct.mainCategoryId,
              subCategoryId: cartproduct.subCategoryId,
              users: [],
              id: cartproduct.id,
            ),
            user: userModel,
            orderStatus: 0,
            id: id,
          );

          ///
          ///
          batch.update(
              firestore
                  .collection(FirebaseCollection.product)
                  .doc(orderModel.product.id),
              {
                'totalOrders': FieldValue.increment(1),
              });
          batch.set(
            firestore.collection(FirebaseCollection.orders).doc(id),
            orderModel.toMap(),
          );
          batch.update(
            firestore.collection(FirebaseCollection.users).doc(userModel.id),
            {'total_orders': FieldValue.increment(1)},
          );
          final date = DateTime.now();
          final formattedDate = DateFormat('yyyy-MM-dd').format(date);
          batch.update(
              firestore
                  .collection(FirebaseCollection.general)
                  .doc(FirebaseCollection.general),
              {
                'totalOrders': FieldValue.increment(1),
              });
          batch.update(
            firestore
                .collection(FirebaseCollection.dailyReports)
                .doc(formattedDate),
            {
              'totalOrdersToday': FieldValue.increment(1),
              'totalGrossWeightToday':
                  FieldValue.increment(orderModel.product.grossWeight),
              'totalNetWeightToday':
                  FieldValue.increment(orderModel.product.netWeight),
            },
          );
        }
      }

      await batch.commit();
      await clearUserCartdata();
      return right(unit);
    } catch (e) {
      return left(
        MainFailure.serverFailure(
          msg: '$e',
        ),
      );
    }
  }

  Future<void> clearUserCartdata() async {
    try {
      final userId = firebaseAuth.currentUser!.uid;
      firestore.collection(FirebaseCollection.users).doc(userId).update(
        {'cart': null},
      );
    } on Exception catch (e) {
      Exception(e);
    }
  }
}
