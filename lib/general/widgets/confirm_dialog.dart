import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/widgets/custom_button.dart';

Future<dynamic> confirmDialog(
  BuildContext? context, {
  required void Function() onPressed,
  String? mssg,
}) {
  return showDialog(
    context: context!,
    builder: (context) => AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 50),
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 20),
      content: Text(
        mssg ?? 'Are you sure?'
        // 'Do you want to remove?'
        ,
        textAlign: TextAlign.center,
      ),
      contentTextStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsOverflowDirection: VerticalDirection.down,
      actions: [
        CButton(
          width: 80,
          height: 40,
          color: AppColors.kBottonColor,
          child: const Text(
            'No',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CButton(
            width: 80,
            height: 40,
            color: AppColors.kBottonColor,
            onPressed: onPressed,
            child: const Text(
              'Yes',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )),
      ],
    ),
  );
}
