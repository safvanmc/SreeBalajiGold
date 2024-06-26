import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final String icon;
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
      leading: ImageIcon(
        AssetImage(icon),
        size: 20,
        color: secondaryColor,
      ),
      onTap: onTap,
    );
  }
}
