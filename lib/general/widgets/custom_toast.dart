import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CToast {
  static void warning({
    required String msg,
  }) {
    toastification.show(
      type: ToastificationType.warning,
      title: Text(
        msg,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      primaryColor: Colors.amber.shade200,
      // backgroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: false,
    );
  }

  static void success({
    required String msg,
  }) {
    toastification.show(
      type: ToastificationType.success,
      title: Text(
        msg,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      primaryColor: Colors.green.shade400,
      // backgroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: false,
    );
  }

  static void info({
    required String msg,
  }) {
    toastification.show(
      type: ToastificationType.info,
      title: Text(
        msg,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      primaryColor: Colors.blue.shade400,
      // backgroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: false,
    );
  }

  static void error({
    required String msg,
  }) {
    toastification.show(
      type: ToastificationType.error,
      title: Text(
        msg,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      primaryColor: Colors.red.shade400,
      // backgroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: false,
    );
  }
}

// class CToast {
//   static void successMessage(BuildContext context,
//       {String? title, required String description}) {
//     final mq = MediaQuery.sizeOf(context);

//     ElegantNotification.success(
//       position: Alignment.topRight,
//       width: mq.width * 0.9,

//       // isDismissible: false,
//       stackedOptions: StackedOptions(
//         key: 'topRight',
//         type: StackedType.same,
//         itemOffset: const Offset(-5, -5),
//       ),
//       title: Text(title ?? 'Success'),
//       shadow: BoxShadow(
//         color: Colors.black.withOpacity(0.2),
//         spreadRadius: 3,
//         blurRadius: 7,
//         offset: const Offset(0, 3),
//       ),

//       description: Text(description),
//     ).show(context);
//   }

//   static void errorMessage(BuildContext context,
//       {String? title, required String description}) {
//     final mq = MediaQuery.sizeOf(context);

//     ElegantNotification.error(
//       width: mq.width * 0.9,

//       position: Alignment.topRight,

//       // isDismissible: false,
//       stackedOptions: StackedOptions(
//         key: 'topRight',
//         type: StackedType.above,
//         itemOffset: const Offset(-5, -5),
//       ),
//       title: Text(title ?? 'error'),
//       shadow: BoxShadow(
//         color: Colors.black.withOpacity(0.2),
//         spreadRadius: 3,
//         blurRadius: 7,
//         offset: const Offset(0, 3),
//       ),

//       description: Text(description),
//     ).show(context);
//   }

//   static void info(BuildContext context,
//       {String? title, required String description}) {
//     final mq = MediaQuery.sizeOf(context);

//     ElegantNotification.info(
//       width: mq.width * 0.9,
//       position: Alignment.topRight,
//       shadow: BoxShadow(
//         color: Colors.black.withOpacity(0.2),
//         spreadRadius: 3,
//         blurRadius: 7,
//         offset: const Offset(0, 3),
//       ),

//       // isDismissible: false,
//       stackedOptions: StackedOptions(
//         key: 'topRight',
//         type: StackedType.same,
//         itemOffset: const Offset(-5, -5),
//       ),
//       title: Text(title ?? 'info'),

//       description: Text(description),
//     ).show(context);
//   }

//   static void error(BuildContext context, {required String description}) {}
// }
