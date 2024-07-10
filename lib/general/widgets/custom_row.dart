import 'package:flutter/material.dart';

class CRowWidget extends StatelessWidget {
  const CRowWidget({
    super.key,
    required this.data,
    required this.keyvalue,
  });

  final String data;
  final String keyvalue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          keyvalue,
          style: const TextStyle(
            color: Color(0xFF333333),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        Text(
          data,
          style: const TextStyle(
            color: Color(0xFF333333),
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        )
      ],
    );
  }
}
