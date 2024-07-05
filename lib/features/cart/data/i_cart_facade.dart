import 'package:dartz/dartz.dart';
import 'package:sree_balagi_gold/features/auth/data/model/user_model.dart';
import 'package:sree_balagi_gold/features/cart/data/model/cart_model.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';

abstract class ICartFacade {
  FutureResult<Unit> addToCart(ProductModel productModel, UserModel userModel) {
    throw UnimplementedError('addtoCart() not imlemented');
  }

  FutureResult<Unit> removeFromCart(String productId, UserModel userModel) {
    throw UnimplementedError('addtoCart() not imlemented');
  }

  FutureResult<List<CartModel>> fetchCratData(
      List<Map<String, dynamic>> productId) {
    throw UnimplementedError('GetCart() not imlemented');
  }

  FutureResult<Unit> addQty(CartModel model, UserModel userModel) {
    throw UnimplementedError('addQty() not imlemented');
  }

  FutureResult<Unit> removeQty(CartModel model, UserModel userModel) {
    throw UnimplementedError('addQty() not imlemented');
  }
}
