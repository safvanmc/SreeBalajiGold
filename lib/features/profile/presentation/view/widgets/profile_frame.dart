import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class ProfileFrame extends StatelessWidget {
  const ProfileFrame({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
    this.child,
  });
  final String title;
  final String? icon;
  final Widget? child;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // minVerticalPadding: 10,
      minTileHeight: 50,
      title: Text(
        title,
        style: appTextTheme.bodySmall!.copyWith(
            decoration: TextDecoration.none,
            fontSize: 13,
            color: Colors.black87),
      ),
      leading: child ??
          ImageIcon(
            AssetImage(icon!),
            size: 20,
            color: const Color.fromARGB(235, 98, 76, 105),
          ),
      onTap: onTap,
    );
  }
}
