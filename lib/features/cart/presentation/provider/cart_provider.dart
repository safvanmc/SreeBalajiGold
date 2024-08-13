import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/auth/presentation/provider/auth_provider.dart';
import 'package:sree_balagi_gold/features/cart/data/i_cart_facade.dart';
import 'package:sree_balagi_gold/features/cart/data/model/cart_model.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/general/service/easy_navigator.dart';
import 'package:sree_balagi_gold/general/widgets/custom_toast.dart';

class CartProvider extends ChangeNotifier {
  final ICartFacade iCartFacade;
  CartProvider(this.iCartFacade);
  List<CartModel> cartList = [];
  bool isLoading = true;

  Future<void> addtoCart(
    BuildContext context,
    ProductModel model,
  ) async {
    if (totalQty(context) >= 100) {
      CToast.info(
        msg: 'Your order limit of 100 reached. Please try in the next order',
      );

      return;
    }
    final userModel = context.read<AuthProvider>().userModel;
    if (userModel == null) {
      CToast.error(
        msg: 'User null',
      );
      return;
    }
    final result = await iCartFacade.addToCart(
      model,
      userModel,
    );
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
        msg: 'User null',
      );
      return;
    }
    final result = await iCartFacade.removeFromCart(
      productId,
      userModel,
    );
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
    // notifyListeners();
    final productIdList = (context.read<AuthProvider>().userModel?.cart ?? []);

    final result = await iCartFacade.fetchCartData(productIdList);
    result.fold(
      (l) {
        log("-----------${l.msg}");
      },
      (r) {
        cartList = r;
      },
    );
    isLoading = false;
    notifyListeners();
  }

  num get totalGrossWeight {
    num total = 0;
    for (var element in cartList) {
      total = total + (element.grossWeight * (element.qty ?? 1));
    }
    return total;
  }

  num get totalNetWeight {
    num total = 0;
    for (var element in cartList) {
      total = total + (element.netWeight * (element.qty ?? 1));
    }
    return total;
  }

  num get totalPieces {
    num total = 0;
    for (var element in cartList) {
      total = total + (element.pieces * (element.qty ?? 1));
    }
    return total;
  }

  num totalQty(BuildContext context) {
    final userModel = context.read<AuthProvider>().userModel;
    num total = 0;
    for (Map<String, dynamic> element in userModel?.cart ?? []) {
      final id = element.entries.first.key;

      total = total + (element[id]['qty']);
    }
    return total;
  }

  Future<void> addQty(
    BuildContext context, {
    required CartModel cartModel,
  }) async {
    if (totalQty(context) >= 100) {
      CToast.warning(
          msg: 'Your order limit of 100 reached. Please try in the next order');
      return;
    }
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

  Future<void> addremarks(
    BuildContext context, {
    required CartModel cartModel,
    required String? remarks,
  }) async {
    final index = cartList.indexWhere(
      (element) => element.id == cartModel.id,
    );

    cartList[index].remark = remarks;
    final userModel = context.read<AuthProvider>().userModel;
    iCartFacade.changeRemark(
      cartList[index],
      userModel!,
    );
    notifyListeners();
  }

  Future<void> removeRemark(
    BuildContext context, {
    required CartModel cartModel,
  }) async {
    final index = cartList.indexWhere(
      (element) => element.id == cartModel.id,
    );

    cartList[index].remark = null;
    final userModel = context.read<AuthProvider>().userModel;
    iCartFacade.changeRemark(
      cartList[index],
      userModel!,
    );
    notifyListeners();
  }

  void clearData() {
    cartList = [];
    // notifyListeners();
  }

  Future<void> placedOrder(
    BuildContext context, {
    required VoidCallback success,
  }) async {
    final userModel = context.read<AuthProvider>().userModel;
    log(userModel!.name!);

    final result = await iCartFacade.placeOrder(
      userModel,
      cartList,
    );
    result.fold(
      (l) {
        EasyNavigator.pop(context);
        log('1234566${l.msg}');
        CToast.error(
          msg: l.msg,
        );
      },
      (r) {
        EasyNavigator.pop(context);
        success();
      },
    );
  }
}
