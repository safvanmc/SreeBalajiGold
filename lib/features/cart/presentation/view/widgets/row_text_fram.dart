import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class Rowwidget extends StatelessWidget {
  const Rowwidget({
    super.key,
    required this.widget,
    required this.keyvalue,
  });

  final String widget;
  final String keyvalue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          keyvalue,
          style: appTextTheme.displaySmall,
        ),
        Text(
          widget,
          style: appTextTheme.bodyMedium!.copyWith(color: Colors.black),
        )
      ],
    );
  }
}
