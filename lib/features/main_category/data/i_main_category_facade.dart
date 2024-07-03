import 'package:sree_balagi_gold/features/main_category/data/model/main_category_model.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';

abstract class IMainCategoryFacade {
  FutureResult<List<MainCategoryModel>> fetchMainCategory(String userID) async {
    throw UnimplementedError('fetchNotification() Not implemented');
  }

  void clearData() {
    throw UnimplementedError('clearData() Not implemented');
  }
}
