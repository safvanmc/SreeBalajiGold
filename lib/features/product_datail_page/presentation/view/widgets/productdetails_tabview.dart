import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class ProductDetailTabView extends StatelessWidget {
  const ProductDetailTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Gap(5),
          ProductDetailTile(
            data: 'Serial no',
            value: '########',
          ),
          Divider(),
          Gap(5),
          ProductDetailTile(
            data: 'Serial no',
            value: '########',
          ),
          Divider(),
          Gap(5),
          ProductDetailTile(
            data: 'Serial no',
            value: '########',
          ),
          Divider(),
          Gap(5),
          ProductDetailTile(
            data: 'Serial no',
            value: '########',
          ),
          Divider(),
          Gap(5),
          ProductDetailTile(
            data: 'Serial no',
            value: '########',
          ),
          Divider(),
        ],
      ),
    );
  }
}

class ProductDetailTile extends StatelessWidget {
  const ProductDetailTile({
    super.key,
    required this.data,
    required this.value,
  });
  final String data;
  final String value;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 50,
      horizontalTitleGap: 120,
      // titleAlignment:
      //     ListTileTitleAlignment.threeLine,
      leading: Text(data),
      leadingAndTrailingTextStyle: appTextTheme.labelSmall!.copyWith(
          fontSize: 13, color: const Color.fromARGB(255, 102, 102, 102)),
      title: Text(value),
      titleTextStyle:
          appTextTheme.displayMedium!.copyWith(decoration: TextDecoration.none),
    );
  }
}
