import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/general/utils/app_images.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_cachednetwork_image.dart';

class NotificationListFram extends StatelessWidget {
  const NotificationListFram({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // contentPadding: const EdgeInsets.all(10.0),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: const CustomCachedNetworkImage(
                    url:
                        'https://s3-alpha-sig.figma.com/img/656e/6d19/6c8526603a2714bf961d776037c539aa?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=muHZgMocptGzKjt5sezfDxtGHgiWgkAgbzraXlgSkVkbpP27irQWC2kEUj4ZAnpIYoQpuwi~d-9OtXwQ6B-DISlbwY~MPzSjXaPc1eCEnQdZrDlgVZlc7clZR0zW-hGATrn1Lm3zcb-bNlZyJejpEhs7po4YcunENRlQN4rfcoeECTDIqyNR3GBHCP5Y8upWer3uLRTcx7a979zLUWXBV4oLjEg5Va98WKn7KsVIMS1q4JzZCIijbVm9jGZrEhpL1AaXY1RxDyl6dMu75x1GVaa50pOdPbeKZVepP2aXVRiM1j3NBQxitwQjOiNwGmd80DzAi1KHiGDB5blo-5IY8Q__',
                    width: 80,
                    height: 80,
                    boxFit: BoxFit.cover,
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'During Diwali, the golden glow symbolizes prosperity and fortune. As families celebrate, gold becomes a cherished gift, embodying blessings, wealth, and the radiant spirit of the festival.',
                        style: appTextTheme.labelSmall!.copyWith(
                          letterSpacing: 0.24,
                        ),
                      ),
                      const Gap(5),
                      Row(
                        children: <Widget>[
                          Image.asset(
                            notifyTime,
                            height: 10,
                            width: 10,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'time',
                            style: appTextTheme.labelSmall!.copyWith(
                              letterSpacing: 0.24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
          const Divider()
        ],
      ),
    );
  }
}
