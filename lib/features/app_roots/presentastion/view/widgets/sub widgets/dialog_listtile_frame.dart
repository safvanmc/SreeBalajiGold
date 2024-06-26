import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/app_roots/presentastion/provider/app_root_provider.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class DialogListTileFrame extends StatelessWidget {
  const DialogListTileFrame({
    super.key,
    required this.name,
    required this.phone,
  });
  final String name;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppRootProvider>(
      builder: (context, state, child) => ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(name),
        ),
        titleTextStyle: appTextTheme.displayMedium!
            .copyWith(fontSize: 12, decoration: TextDecoration.none),
        subtitle: Text('+91 $phone'),
        subtitleTextStyle:
            appTextTheme.labelMedium!.copyWith(color: Colors.grey),
        minTileHeight: 60,
        onTap: () {
          state.shareToWhatsApp();
        },
      ),
    );
  }
}
