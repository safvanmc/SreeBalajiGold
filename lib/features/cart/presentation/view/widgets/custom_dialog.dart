import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

void showDialogCustom(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) => const CustomDialog(),
  );
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      buttonPadding: const EdgeInsets.symmetric(horizontal: 5),
      backgroundColor: kwhiteColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: TextField(
        textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.multiline,
        minLines: 3,
        maxLines: 5,
        
        style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            // decorationStyle: TextDecorationStyle.dotted,
            decoration: TextDecoration.none,
            decorationThickness: 0
            // decorationColor: Colors.transparent
            ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Add a remark",
          hintStyle: appTextTheme.labelSmall!
              .copyWith(color: const Color.fromARGB(255, 137, 136, 136)),
        ),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Close",
            style: appTextTheme.bodyMedium!.copyWith(
              decoration: TextDecoration.underline,
              color: const Color.fromARGB(255, 51, 50, 50),
            ),
          ),
        ),
        TextButton(
            onPressed: () {
              // handle add button press
              Navigator.pop(context);
            },
            style: const ButtonStyle(
              maximumSize: WidgetStatePropertyAll(Size(50, 35)),
              minimumSize: WidgetStatePropertyAll(Size(50, 35)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(6)))),
              backgroundColor: WidgetStatePropertyAll(primaryColor),
            ),
            child: Center(
              child: Text(
                "Add",
                style: appTextTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
            )),
      ],
    );
  }
}
