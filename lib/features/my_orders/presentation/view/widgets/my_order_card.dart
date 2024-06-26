import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/cart/presentation/view/widgets/row_text_fram.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_cachednetwork_image.dart';

class MyOrderCard extends StatelessWidget {
  const MyOrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      decoration: BoxDecoration(
          color: kwhiteColor,
          boxShadow: const [
            BoxShadow(
              color: Color(0x35000000),
              blurRadius: 3,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        children: [
          const CustomCachedNetworkImage(
            url:
                'https://s3-alpha-sig.figma.com/img/c1e8/f360/835ab2f9e15ec87023d353b09808b4ad?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LHgFX7ogC0h66AA3eD0hQPdOVSMruIS88HIL4b7iJ2Iud8vsC4OcCmq1QvIyfur~TDFsLLI07UgZzpy6qJRX-n-8bZT6P9YgfoaQofbNT111CD9KJZBsMD7QJD6hmgKxcNapKVMsXRXtKD7csQIM9FHbXOfQNwdFgQ-9K~E-tUbON0uqiS3mzewWSdiDJ~Vto21V60hW~1RjftRaQu8NyzdtNcBw8PwqfuUWvP-KbqSf0RCheXBr-WED3ptkeMpBYJVcs9ZHXOxACcRb4UEn1jojIBsRAv0Sebo2HMtDSMXjUFYHXXxw8KDcsai81RZYA3a8d8KBhCfvrYutxyM-Ag__',
            boxFit: BoxFit.cover,
            width: 150,
            height: 150,
            // fadeInCurve: Curves.bounceIn,
          ),
          Expanded(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('#######,',
                        style: appTextTheme.bodyMedium!
                            .copyWith(color: Colors.black)),
                  ],
                ),
                const Gap(10),
                const Rowwidget(keyvalue: 'Gross Weight:', widget: '${134}'),
                const Gap(8),
                const Rowwidget(keyvalue: 'Net Weight: ', widget: '${13313}'),
                const Gap(8),
                const Rowwidget(keyvalue: 'Piece: ', widget: '${244}'),
                const Gap(8),
                const Rowwidget(keyvalue: 'Total:', widget: '${12323}'),
                const Rowwidget(keyvalue: 'Status:', widget: 'Under Work'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
