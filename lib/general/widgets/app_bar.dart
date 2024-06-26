import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      leading: const BackButton(
        color: kwhiteColor,
        style: ButtonStyle(
            // visualDensity: VisualDensity.,
            iconSize: WidgetStatePropertyAll(23)),
      ),
      title: Text(
        title,
      ),
      titleSpacing: 0,
      titleTextStyle: appTextTheme.headlineMedium,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
