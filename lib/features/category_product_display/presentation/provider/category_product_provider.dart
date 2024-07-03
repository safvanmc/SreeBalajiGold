import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/auth/presentation/provider/auth_provider.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/i_category_product_facade.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/general/service/custom_toast.dart';

class CategoryProductProvider extends ChangeNotifier {
  CategoryProductProvider(
    this._icategoryProductFacade,
  );
  final ICategoryProductFacade _icategoryProductFacade;
  bool _isProgress = false;
  bool isLoading = true;
  bool isMoreDataLoading = true;
  List<ProductModel> productList = [];

  void initData({
    required BuildContext context,
    required ScrollController scrollController,
    required String subCategoryid,
  }) {
    if (productList.isEmpty) {
      clearData();
      _fetchData(
        context,
        subCategoryid: subCategoryid,
      );
    }

    scrollController.addListener(
      () {
        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.position.pixels;
        final delta = MediaQuery.of(context).size.height * 0.11;
        if ((maxScroll - currentScroll) <= delta &&
            _isProgress == false &&
            isMoreDataLoading == true) {
          _fetchData(
            context,
            subCategoryid: subCategoryid,
          );
        }
      },
    );
  }

  Future<void> _fetchData(BuildContext context,
      {required String subCategoryid}) async {
    if (_isProgress) return;
    _isProgress = true;
    if (productList.isEmpty) {
      isLoading = true;
      notifyListeners();
    }
    final user = context.read<AuthProvider>().userModel;
    if (user == null) {
      CToast.errorMessage(
        context,
        description: 'User null',
      );
      return;
    }
    final result = await _icategoryProductFacade.fetchCategoryProduct(
      userID: user.id!,
      subCategoryid: subCategoryid,
    );
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

            CToast.errorMessage(
              context,
              description: err.msg,
            );
          },
        );
      },
      (list) {
        isLoading = false;
        productList = [...productList, ...list];
        // // CHECK IF REEL VIDEO LIST IS EMPTY OR LESS THAN 10
        if (productList.length < 10 || productList.isEmpty) {
          isMoreDataLoading = false;
        }
      },
    );
    _isProgress = false;
    notifyListeners();
  }

  void clearData() {
    productList = [];
    _icategoryProductFacade.clearData();
    isMoreDataLoading = true;
  }
}
