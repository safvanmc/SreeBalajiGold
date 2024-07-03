import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/auth/presentation/provider/auth_provider.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/features/favorite/data/i_favorite_facade.dart';
import 'package:sree_balagi_gold/general/service/custom_toast.dart';

class FavoriteProvider extends ChangeNotifier {
  FavoriteProvider(this.iFavoriteFacade);
  final IFavoriteFacade iFavoriteFacade;

  Future<void> addFavorite(
    BuildContext context, {
    required ProductModel productModel,
  }) async {
    final user = context.read<AuthProvider>().userModel;
    if (user == null) {
      CToast.errorMessage(
        context,
        description: 'User null',
      );
      return;
    }

    final result = await iFavoriteFacade.addFavorite(
      userModel: user,
      productModel: productModel,
    );
    result.fold(
      (l) {
        CToast.errorMessage(
          context,
          description: l.msg,
        );
      },
      (r) {
        notifyListeners();
      },
    );
  }

  Future<void> removeFavorite(
    BuildContext context, {
    required ProductModel productModel,
  }) async {
    final user = context.read<AuthProvider>().userModel;
    if (user == null) {
      CToast.errorMessage(
        context,
        description: 'User null',
      );
      return;
    }

    final result = await iFavoriteFacade.removeFavorite(
      userModel: user,
      productModel: productModel,
    );

    result.fold(
      (l) {
        CToast.errorMessage(
          context,
          description: l.msg,
        );
      },
      (r) {
        notifyListeners();
      },
    );
  }

  bool isFavorite(
    BuildContext context, {
    required ProductModel productModel,
  }) {
    return context.read<AuthProvider>().userModel!.favorites.contains(
          productModel.id,
        );
  }

  bool isLoading = false;

  List<ProductModel> list = [];
  List<String> _tempProductIds = [];

  void init(
    BuildContext context, {
    required ScrollController scrollController,
    required List<String> productIds,
  }) {
    if (isLoading) return;
    iFavoriteFacade.clearData();
    list = [];
    _tempProductIds = [];
    _tempProductIds.addAll(productIds);

    _fetchData(
      context,
      productIds: productIds,
    );

    scrollController.addListener(() {
      if (scrollController.position.pixels != 0 &&
          scrollController.position.atEdge &&
          isLoading == false) {
        _fetchData(
          context,
          productIds: productIds,
        );
      }
    });
  }

  Future<void> _fetchData(
    BuildContext context, {
    required List<String> productIds,
  }) async {
    if (isLoading) return;

    isLoading = true;
    notifyListeners();
    final result = await iFavoriteFacade.fetchFavoriteProducts(productIds);
    result.fold((failure) {
      log(failure.msg);
      CToast.errorMessage(
        context,
        description: failure.msg,
      );
      isLoading = false;
      notifyListeners();
    }, (success) {
      list.addAll(success);

      isLoading = false;
      notifyListeners();
    });
  }

  void clearData() {}
}
