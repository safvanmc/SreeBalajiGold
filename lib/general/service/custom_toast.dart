import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:flutter/material.dart';

class CToast {
  static void successMessage(BuildContext context,
      {String? title, required String description}) {
    final mq = MediaQuery.sizeOf(context);

    ElegantNotification.success(
      position: Alignment.topRight,
      width: mq.width * 0.9,

      // isDismissible: false,
      stackedOptions: StackedOptions(
        key: 'topRight',
        type: StackedType.same,
        itemOffset: const Offset(-5, -5),
      ),
      title: Text(title ?? 'Success'),
      shadow: BoxShadow(
        color: Colors.black.withOpacity(0.2),
        spreadRadius: 3,
        blurRadius: 7,
        offset: const Offset(0, 3),
      ),

      description: Text(description),
    ).show(context);
  }

  static void errorMessage(BuildContext context,
      {String? title, required String description}) {
    final mq = MediaQuery.sizeOf(context);

    ElegantNotification.error(
      width: mq.width * 0.9,

      position: Alignment.topRight,

      // isDismissible: false,
      stackedOptions: StackedOptions(
        key: 'topRight',
        type: StackedType.above,
        itemOffset: const Offset(-5, -5),
      ),
      title: Text(title ?? 'error'),
      shadow: BoxShadow(
        color: Colors.black.withOpacity(0.2),
        spreadRadius: 3,
        blurRadius: 7,
        offset: const Offset(0, 3),
      ),

      description: Text(description),
    ).show(context);
  }

  static void info(BuildContext context,
      {String? title, required String description}) {
    final mq = MediaQuery.sizeOf(context);

    ElegantNotification.info(
      width: mq.width * 0.9,
      position: Alignment.topRight,
      shadow: BoxShadow(
        color: Colors.black.withOpacity(0.2),
        spreadRadius: 3,
        blurRadius: 7,
        offset: const Offset(0, 3),
      ),

      // isDismissible: false,
      stackedOptions: StackedOptions(
        key: 'topRight',
        type: StackedType.same,
        itemOffset: const Offset(-5, -5),
      ),
      title: Text(title ?? 'info'),

      description: Text(description),
    ).show(context);
  }

  static void error(BuildContext context, {required String description}) {}
}
