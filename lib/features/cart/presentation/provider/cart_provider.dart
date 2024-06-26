import 'dart:developer';

import 'package:flutter/material.dart';

class CartViewprovider extends ChangeNotifier {
  int count = 1;

  void onAdd() {
    count++;
    log(count.toString());
    notifyListeners();
  }

  void onLess() {
    if (count != 1) {
      count--;
    }
    notifyListeners();
  }
}
