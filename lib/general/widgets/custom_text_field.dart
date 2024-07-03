import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/text_style.dart';

class CTextField extends StatelessWidget {
  const CTextField({
    super.key,
    this.label,
    this.hintText,
    this.keyboardType,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.validator,
    this.autovalidateMode,
    this.maxLength,
    this.maxLines,
    this.textInputAction = TextInputAction.next,
  });
  final Widget? label;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final int? maxLength;
  final int? maxLines;
  final TextInputAction textInputAction;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      maxLength: maxLength,
      maxLines: maxLines,
      validator: validator,
      style: const TextStyle(
        fontSize: 14,
      ),
      autovalidateMode: autovalidateMode,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
        label: label,
        hintText: hintText,
        hintStyle: appTextTheme.labelSmall!.copyWith(
          fontSize: 13,
          color: Colors.black.withOpacity(0.4),
        ),
        labelStyle: appTextTheme.labelMedium!.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.black.withOpacity(.6),
        ),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0.2),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0.2),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0.2),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0.2),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
