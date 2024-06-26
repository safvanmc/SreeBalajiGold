import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/firstcatagory/presentation/view/widgets/catagory_card.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class CatagoryScreen extends StatelessWidget {
  const CatagoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ListTile(
              tileColor: primaryColor.withOpacity(0.3),
              leading: const Icon(
                CupertinoIcons.pin_fill,
                size: 15,
              ),
              titleTextStyle:
                  appTextTheme.bodySmall!.copyWith(color: Colors.black),
              title: const Text(
                  'Explore our complete product range! Dial or message on  WhatsApp to view all')),
        ),
        const SliverGap(20),
        const CatagoryCard()
      ],
    );
  }
}
