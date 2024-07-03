import 'package:dartz/dartz.dart';
import 'package:sree_balagi_gold/features/auth/data/model/user_model.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';

abstract class IFavoriteFacade {
  FutureResult<Unit> addFavorite({
    required UserModel userModel,
    required ProductModel productModel,
  }) async {
    throw UnimplementedError('addFavorite() not implement');
  }

  FutureResult<Unit> removeFavorite({
    required UserModel userModel,
    required ProductModel productModel,
  }) async {
    throw UnimplementedError('removeFavorite() not implement');
  }

  FutureResult<List<ProductModel>> fetchFavoriteProducts(
    List<String> productIds,
  ) {
    throw UnimplementedError('fetchFavoriteProducts() not implement');
  }

  void clearData() {
    throw UnimplementedError('clearData() not implement');
  }
}
