import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';

class CIconButton extends StatelessWidget {
  const CIconButton({
    super.key,
    required this.icon,
    this.ontap,
  });
  final IconData icon;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        constraints: const BoxConstraints(),
        style: ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 0)),
            minimumSize: const WidgetStatePropertyAll(Size(25, 25)),
            maximumSize: const WidgetStatePropertyAll(Size(25, 25)),
            // fixedSize: const WidgetStatePropertyAll(),
            backgroundColor:
                const WidgetStatePropertyAll(AppColors.primaryColor),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)))),
        // alignment: Alignment.center,
        iconSize: 12,
        icon: Center(child: Icon(icon, color: Colors.white)),
        onPressed: ontap);
  }
}
