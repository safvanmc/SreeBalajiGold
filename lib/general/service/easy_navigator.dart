import 'package:flutter/material.dart';

class EasyNavigator {
  static Future<void> push(
    BuildContext context, {
    required Widget child,
  }) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return child;
        },
      ),
    );
  }

  static Future<void> pushReplacement(
    BuildContext context, {
    required Widget child,
  }) async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return child;
        },
      ),
    );
  }

  static Future<void> pushAndRemoveUntil(
    BuildContext context, {
    required Widget child,
  }) async {
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return child;
        },
      ),
      (route) => false,
    );
  }

  static void pop<T>(
    BuildContext context, {
    T? result,
  }) {
    Navigator.pop(context, result);
  }
}
