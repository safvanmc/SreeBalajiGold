import 'dart:developer';

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

  void onPressedFavourite() {
    isTapped = !isTapped;
    notifyListeners();
  }

  //jump to images//
  jumpToIndex() {
    controller.jumpToPage(activeIndex);
    notifyListeners();
  }

  //jump to banner//
  void updateBannerIndex(int index) {
    log('jump');
    // controller.animateToPage(index,
    //     duration: Duration(seconds: 1), curve: Curves.linear);
    activeIndex = index;
    jumpToIndex();
    notifyListeners();
  }

  bool addCart = false;
  void addToCart() {
    addCart = !addCart;
    notifyListeners();
  }

  reset() {
    activeIndex = 0;
    notifyListeners();
  }
}
