import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/auth/presentation/provider/auth_provider.dart';
import 'package:sree_balagi_gold/features/sub_category/data/i_sub_category_facade.dart';
import 'package:sree_balagi_gold/features/sub_category/data/model/sub_category_model.dart';
import 'package:sree_balagi_gold/general/service/custom_toast.dart';

class SubCategoryProvider extends ChangeNotifier {
  SubCategoryProvider(
    this._iSubCategoryFacade,
  );
  final ISubCategoryFacade _iSubCategoryFacade;
  bool _isProgress = false;
  bool isLoading = true;
  bool isMoreDataLoading = true;
  List<SubCategoryModel> subCategoryList = [];

  void initData({
    required BuildContext context,
    required ScrollController scrollController,
    required String mainCategoryID,
  }) {
    if (subCategoryList.isEmpty) {
      clearData();
      _fetchData(context, mainCategoryID: mainCategoryID);
    }

    scrollController.addListener(
      () {
        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.position.pixels;
        final delta = MediaQuery.of(context).size.height * 0.11;
        if ((maxScroll - currentScroll) <= delta &&
            _isProgress == false &&
            isMoreDataLoading == true) {
          _fetchData(context, mainCategoryID: mainCategoryID);
        }
      },
    );
  }

  Future<void> _fetchData(BuildContext context,
      {required String mainCategoryID}) async {
    if (_isProgress) return;
    _isProgress = true;
    if (subCategoryList.isEmpty) {
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

    final result = await _iSubCategoryFacade.fetchSubCategory(
      mainCategoryID: mainCategoryID,
      userID: user.id!,
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
        subCategoryList = [...subCategoryList, ...list];
        // // CHECK IF REEL VIDEO LIST IS EMPTY OR LESS THAN 10
        if (subCategoryList.length < 10 || subCategoryList.isEmpty) {
          isMoreDataLoading = false;
        }
      },
    );
    _isProgress = false;
    notifyListeners();
  }

  void clearData() {
    subCategoryList = [];
    _iSubCategoryFacade.clearData();
    isMoreDataLoading = true;
  }
}
