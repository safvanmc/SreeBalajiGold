import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  const CButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.color = const Color.fromARGB(255, 95, 82, 99),
    this.height = 47,
    this.width = double.infinity,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    this.elevation,
    this.side = BorderSide.none,
  });

  final double? height;
  final double? width;
  final Widget? child;
  final void Function() onPressed;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final BorderRadiusGeometry borderRadius;
  final double? elevation;
  final BorderSide side;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: MaterialButton(
        elevation: elevation,
        height: height,
        minWidth: width,
        onPressed: onPressed,
        color: color,
        padding: padding,
        shape: RoundedRectangleBorder(
          side: side,
          borderRadius: borderRadius,
        ),
        child: child,
      ),
    );
  }
}
