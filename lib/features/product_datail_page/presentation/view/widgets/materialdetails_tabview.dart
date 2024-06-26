import 'package:flutter/material.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              type,
              style: style,
            ),
            Text(
              weight,
              style: style,
            ),
            Text(
              piece,
              style: style,
            ),
            Text(
              total,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
