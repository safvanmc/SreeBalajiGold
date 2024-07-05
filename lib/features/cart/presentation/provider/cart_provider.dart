import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/auth/presentation/provider/auth_provider.dart';
import 'package:sree_balagi_gold/features/cart/data/i_cart_facade.dart';
import 'package:sree_balagi_gold/features/cart/data/model/cart_model.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/general/service/custom_toast.dart';

class CartProvider extends ChangeNotifier {
  final ICartFacade iCartFacade;
  CartProvider(this.iCartFacade);
  List<CartModel> cartList = [];
  int itemCount = 1;
  bool isLoading = true;

  // bool isCarted({
  //   required BuildContext context,
  //   required ProductModel productModel,
  // }) {
  //   return context
  //       .read<AuthProvider>()
  //       .userModel!
  //       .cart!
  //       .any((map) => map.containsKey(productModel.id));
  // }

  Future<void> addtoCart(
    BuildContext context,
    ProductModel model,
  ) async {
    final userModel = context.read<AuthProvider>().userModel;
    if (userModel == null) {
      CToast.error(
        context,
        description: 'User null',
      );
      return;
    }
    final result = await iCartFacade.addToCart(model, userModel);
    result.fold(
      (e) {
        log(e.msg);
      },
      (r) {
        log('cartadded');
      },
    );
  }

  Future<void> removeFromCart(BuildContext context,
      {required productId}) async {
    final userModel = context.read<AuthProvider>().userModel;

    if (userModel == null) {
      CToast.error(
        context,
        description: 'User null',
      );
      return;
    }
    final result = await iCartFacade.removeFromCart(productId, userModel);
    result.fold(
      (e) {
        log(e.msg);
      },
      (r) {
        cartList.removeWhere(
          (element) => element.id == productId,
        );
        notifyListeners();
      },
    );
  }

  Future<void> fetchData(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final productIdList = context.read<AuthProvider>().userModel?.cart ?? [];
    final result = await iCartFacade.fetchCratData(productIdList);
    result.fold(
      (l) {
        log("-----------${l.msg}");
      },
      (r) {
        cartList.addAll(r);
      },
    );
    isLoading = false;
    notifyListeners();
  }

  Future<void> addQty(
    BuildContext context, {
    required CartModel cartModel,
  }) async {
    final index = cartList.indexWhere(
      (element) => element.id == cartModel.id,
    );
    cartList[index].qty = (cartList[index].qty ?? 1) + 1;
    final userModel = context.read<AuthProvider>().userModel;
    iCartFacade.addQty(
      cartList[index],
      userModel!,
    );
    notifyListeners();
  }

  Future<void> removeQty(
    BuildContext context, {
    required CartModel cartModel,
  }) async {
    final index = cartList.indexWhere(
      (element) => element.id == cartModel.id,
    );
    if (cartList[index].qty! <= 1) return;
    cartList[index].qty = (cartList[index].qty ?? 1) - 1;
    final userModel = context.read<AuthProvider>().userModel;
    iCartFacade.removeQty(
      cartList[index],
      userModel!,
    );
    notifyListeners();
  }

  void clearData() {
    cartList.clear();
    notifyListeners();
  }
}
