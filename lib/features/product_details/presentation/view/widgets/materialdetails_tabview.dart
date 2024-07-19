import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MaterialDetailRow extends StatelessWidget {
  const MaterialDetailRow({
    super.key,
    required this.stoneType,
    required this.weight,
    required this.piece,
    required this.style,
    required this.stoneName,
  });
  final String stoneType;
  final String stoneName;
  final String weight;
  final String piece;

  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Gap(2),
            Expanded(
              child: Text(
                stoneType,
                style: style,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                stoneName,
                style: style,
                textAlign: TextAlign.center,
              ),
            ),
            const Gap(2),
            Expanded(
              child: Text(
                weight,
                style: style,
                textAlign: TextAlign.center,
              ),
            ),
            const Gap(2),
            Expanded(
              child: Text(
                piece,
                style: style,
                textAlign: TextAlign.center,
              ),
            ),
            const Gap(2),
          ],
        ),
      ),
    );
  }
}
