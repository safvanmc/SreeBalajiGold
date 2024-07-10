import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/auth/presentation/provider/auth_provider.dart';
import 'package:sree_balagi_gold/features/my_orders/data/i_order_facade.dart';
import 'package:sree_balagi_gold/features/my_orders/data/model/my_order_model.dart';
import 'package:sree_balagi_gold/general/widgets/custom_toast.dart';

class OrderProvider extends ChangeNotifier {
  final IOrderFacade iOrderFacade;
  OrderProvider(this.iOrderFacade);
  List<MyOrderModel> orderList = [];
  bool _isProgress = false;
  bool isLoading = true;
  bool isMoreDataLoading = true;
  void initData({
    required BuildContext context,
    required ScrollController scrollController,
  }) {
    //   if (orderList.isEmpty) {
    clearData();
    getOrders(context);
    // }

    scrollController.addListener(
      () {
        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.position.pixels;
        final delta = MediaQuery.of(context).size.height * 0.11;
        if ((maxScroll - currentScroll) <= delta &&
            _isProgress == false &&
            isMoreDataLoading == true) {
          getOrders(context);
        }
      },
    );
  }

  Future<void> getOrders(BuildContext context) async {
    if (_isProgress) return;
    _isProgress = true;
    if (orderList.isEmpty) {
      isLoading = true;
      // notifyListeners();
    }
    final userId = context.read<AuthProvider>().userModel!.id;
    final result = await iOrderFacade.getOrders(userId: userId!);
    result.fold(
      (l) {
        l.maybeMap(
          orElse: () {},
          noData: (noData) {
            isLoading = false;
            isMoreDataLoading = false;
            log(noData.msg);
          },
          serverFailure: (err) {
            isLoading = false;

            CToast.error(
              msg: err.msg,
            );
          },
        );
      },
      (list) {
        isLoading = false;
        orderList = [...orderList, ...list];
        // // CHECK IF REEL VIDEO LIST IS EMPTY OR LESS THAN 10
        if (orderList.length < 10 || orderList.isEmpty) {
          isMoreDataLoading = false;
        }
      },
    );
    _isProgress = false;
    notifyListeners();
  }

  // void changeLoading(bool value) {
  //   isLoading = value;
  // }

  void clearData() {
    orderList = [];
    iOrderFacade.clearData();
    isMoreDataLoading = true;
    // notifyListeners();
  }
}
