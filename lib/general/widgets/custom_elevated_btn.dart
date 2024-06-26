import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';

class ElevatedCutsomBtn extends StatelessWidget {
  const ElevatedCutsomBtn({
    super.key,
    required this.child,
    required this.onPressed,
    this.color = kBottonColor,
    this.height = 47,
    this.width = double.infinity,
    this.decoration,
  });
  final double? height;
  final double? width;
  final Widget? child;
  final void Function()? onPressed;
  final Color? color;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: decoration,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 18)),
            backgroundColor: WidgetStatePropertyAll(color),
            // elevation: WidgetStatePropertyAll(elevation),
            // shadowColor: const WidgetStatePropertyAll(kBottonColor),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)))),
        child: child,
      ),
    );
  }
}
