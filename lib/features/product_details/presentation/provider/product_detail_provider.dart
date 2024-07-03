

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class ProductDetailProvider extends ChangeNotifier {
  CarouselController controller = CarouselController();
  int activeIndex = 0;
  bool isTapped = false;

  //slide change banner//
  onPageChange(index) {
    activeIndex = index;
    notifyListeners();
  }

  //add to favourite//


  //jump to images//
  jumpToIndex() {
    controller.jumpToPage(activeIndex);
    notifyListeners();
  }

  //jump to banner//
  void updateBannerIndex(int index) {

    activeIndex = index;
    jumpToIndex();
    notifyListeners();
  }



  reset() {
    activeIndex = 0;
    notifyListeners();
  }
}
