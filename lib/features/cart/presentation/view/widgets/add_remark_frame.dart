import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/general/service/easy_navigator.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';

void addRemarkFrame(BuildContext context,
    {required void Function()? onPressed,
    required TextEditingController? controller,
    required Key? formKey}) async {
  return showDialog(
    context: context,
    builder: (context) => CustomDialog(
      onPressed: onPressed,
      controller: controller,
      formKey: formKey,
    ),
  );
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.onPressed,
    required this.controller,
    required this.formKey,
  });
  final void Function()? onPressed;
  final TextEditingController? controller;
  final Key? formKey;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      buttonPadding: const EdgeInsets.symmetric(horizontal: 5),
      backgroundColor: AppColors.kwhiteColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Form(
        key: formKey,
        child: TextFormField(
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          minLines: 3,
          maxLines: 5,
          style: const TextStyle(fontSize: 14, decoration: TextDecoration.none),
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) return 'please add a remark';
            return null;
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "add remark",
            hintStyle: TextStyle(
              color: Color(0xFF6D5959),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      actions: [
        TextButton(
          onPressed: () {
            EasyNavigator.pop(context);
          },
          child: const Text("Close",
              style: TextStyle(
                color: Color(0xFF474747),
                fontSize: 12,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                height: 0,
              )),
        ),
        TextButton(
            onPressed: onPressed,
            style: const ButtonStyle(
              maximumSize: WidgetStatePropertyAll(
                Size(50, 35),
              ),
              minimumSize: WidgetStatePropertyAll(
                Size(50, 35),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.all(
                    Radius.circular(6),
                  ),
                ),
              ),
              backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
            ),
            child: const Center(
              child: Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            )),
      ],
    );
  }
}
