import 'package:sree_balagi_gold/features/banner/data/model/banner_model.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';

abstract class IBannerFacade {
  StreamResult<List<BannerModel>> fetchBanner() {
    throw UnimplementedError('fetchBanner() Not implemented');
  }
}
