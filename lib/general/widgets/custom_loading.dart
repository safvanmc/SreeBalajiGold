import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';

class CLoading extends StatelessWidget {
  const CLoading({
    super.key,
    this.margin = const EdgeInsets.all(8.0),
  });
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: LoadingAnimationWidget.hexagonDots(
        color: AppColors.primaryColor,
        size: 40,
      ),
    );
  }
}
