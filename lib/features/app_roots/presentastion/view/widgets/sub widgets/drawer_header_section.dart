import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class HeadSection extends StatelessWidget {
  const HeadSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(50),
        const CircleAvatar(
          radius: 40,
          backgroundImage: CachedNetworkImageProvider(
              'https://images.alphacoders.com/476/thumb-1920-476970.jpg'),
        ),
        const Gap(15),
        Text(
          'Safwan',
          style: appTextTheme.labelLarge!.copyWith(color: Colors.black),
        ),
        Text('9139817983',
            style: appTextTheme.bodySmall!.copyWith(color: Colors.black)),
        const Gap(20),
      ],
    );
  }
}
