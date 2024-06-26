import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_images.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class LogoutSection extends StatelessWidget {
  const LogoutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          'Logout',
          style: appTextTheme.bodySmall!.copyWith(
              decoration: TextDecoration.none,
              fontSize: 13,
              color: Colors.black87),
        ),
        onTap: () {},
        leading: ImageIcon(
          AssetImage(exit),
          size: 20,
          color: secondaryColor,
        ));
  }
}
