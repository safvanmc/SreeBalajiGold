import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/auth/presentation/provider/auth_provider.dart';
import 'package:sree_balagi_gold/features/main_category/data/i_main_category_facade.dart';
import 'package:sree_balagi_gold/features/main_category/data/model/main_category_model.dart';
import 'package:sree_balagi_gold/general/service/custom_toast.dart';

class MainCategoryProvider extends ChangeNotifier {
  MainCategoryProvider(
    this._iMainCategoryFacade,
  );
  final IMainCategoryFacade _iMainCategoryFacade;
  bool _isProgress = false;
  bool isLoading = true;
  bool isMoreDataLoading = true;
  List<MainCategoryModel> mainCategoryList = [];

  Future<void> initData({
    required BuildContext context,
    required ScrollController scrollController,
  }) async{
    if (mainCategoryList.isEmpty) {
      clearData();
     await _fetchData(context);
    }

    scrollController.addListener(
      () {
        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.position.pixels;
        final delta = MediaQuery.of(context).size.height * 0.11;
        if ((maxScroll - currentScroll) <= delta &&
            _isProgress == false &&
            isMoreDataLoading == true) {
          _fetchData(context);
        }
      },
    );
  }

  Future<void> _fetchData(BuildContext context) async {
    if (_isProgress) return;
    _isProgress = true;
    if (mainCategoryList.isEmpty) {
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
    final result = await _iMainCategoryFacade.fetchMainCategory(user.id!);
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
        mainCategoryList = [...mainCategoryList, ...list];
        // // CHECK IF REEL VIDEO LIST IS EMPTY OR LESS THAN 10
        if (mainCategoryList.length < 10 || mainCategoryList.isEmpty) {
          isMoreDataLoading = false;
        }
      },
    );
    _isProgress = false;
    notifyListeners();
  }

  void clearData() {
    mainCategoryList = [];
    _iMainCategoryFacade.clearData();
    isMoreDataLoading = true;
  }

  /// Home Screen
  MainCategoryModel? selectedHomeMainCategory;
  void onChangeHomeMainCategory(MainCategoryModel value) {
    selectedHomeMainCategory = value;
    notifyListeners();
  }
}
