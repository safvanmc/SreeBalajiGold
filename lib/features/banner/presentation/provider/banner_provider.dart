import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:sree_balagi_gold/features/banner/data/i_banner_facade.dart';
import 'package:sree_balagi_gold/features/banner/data/model/banner_model.dart';

class BannerProvider extends ChangeNotifier {
  BannerProvider(
    this._iBannerFacade,
  );
  CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  void onBannerChange(int index) {
    currentIndex = index;
    notifyListeners();
  }

  //
  List<BannerModel> list = [];
  final IBannerFacade _iBannerFacade;

  void fetchBanner() {
    final result = _iBannerFacade.fetchBanner();
    result.listen(
      (event) {
        event.fold(
          (l) {},
          (list) {
            this.list = list;
            notifyListeners();
          },
        );
      },
    );
  }
}
