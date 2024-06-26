import 'package:flutter/material.dart';

class ThirdCatagoryProvider with ChangeNotifier {
  int? tapedIndex;
  void onPressedAFavourite(index) {
    tapedIndex = index;
    notifyListeners();
  }
}
