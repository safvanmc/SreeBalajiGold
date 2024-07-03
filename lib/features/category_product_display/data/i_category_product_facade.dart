import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';

abstract class ICategoryProductFacade {
  FutureResult<List<ProductModel>> fetchCategoryProduct({
    required String userID,
    required String subCategoryid,
  }) async {
    throw UnimplementedError('fetchCategoryProduct() Not implemented');
  }

  void clearData() {
    throw UnimplementedError('clearData() Not implemented');
  }
}
