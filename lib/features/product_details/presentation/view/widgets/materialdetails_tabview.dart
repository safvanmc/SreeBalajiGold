import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MaterialDetailRow extends StatelessWidget {
  const MaterialDetailRow({
    super.key,
    required this.type,
    required this.weight,
    required this.piece,
    required this.total,
    required this.style,
  });
  final String type;
  final String weight;
  final String piece;
  final String total;
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
                type,
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
            Expanded(
              child: Text(
                total,
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
