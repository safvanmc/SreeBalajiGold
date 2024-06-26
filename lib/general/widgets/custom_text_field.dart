import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    this.label,
    this.hintText,
    this.keyboardType,
  });
  final Widget? label;
  final String? hintText;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
          label: label,
          hintText: hintText,
          hintStyle: appTextTheme.labelSmall!
              .copyWith(fontSize: 13, color: Colors.black.withOpacity(0.4)),
          labelStyle: appTextTheme.labelMedium!
              .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(0, 0, 0, 0.2),
              ),
              borderRadius: BorderRadius.circular(4)),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(0, 0, 0, 0.2),
              ),
              borderRadius: BorderRadius.circular(4)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(0, 0, 0, 0.2),
              ),
              borderRadius: BorderRadius.circular(4)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(0, 0, 0, 0.2),
              ),
              borderRadius: BorderRadius.circular(4))),
    );
  }
}
