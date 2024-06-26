import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  bool isLoading = false;
  int buttonIndex = 0;
  // carousal screen changing
  void onBannerChange(index) {
    currentIndex = index;
    notifyListeners();
  }

  void buttonChange(value) {
    buttonIndex = value;
    notifyListeners();
  }
}
