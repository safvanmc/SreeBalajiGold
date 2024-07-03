import 'package:sree_balagi_gold/features/sub_category/data/model/sub_category_model.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';

abstract class ISubCategoryFacade {
  FutureResult<List<SubCategoryModel>> fetchSubCategory({
    required String userID,
    required String mainCategoryID,
  }) async {
    throw UnimplementedError('fetchNotification() Not implemented');
  }

  void clearData() {
    throw UnimplementedError('clearData() Not implemented');
  }
}
