import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/features/cart/presentation/view/screens/placed_order_screen.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_elevated_btn.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      color: primaryColor.withOpacity(0.1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: 'Gross Weight:  ',
                    style: appTextTheme.displaySmall!
                        .copyWith(color: const Color.fromARGB(255, 95, 94, 94)),
                    children: [
                      TextSpan(
                          text: '56.965',
                          style: appTextTheme.bodyMedium!
                              .copyWith(color: Colors.black))
                    ]),
              ),
              RichText(
                text: TextSpan(
                    text: 'Net Weight:  ',
                    style: appTextTheme.displaySmall!
                        .copyWith(color: const Color.fromARGB(255, 95, 94, 94)),
                    children: [
                      TextSpan(
                          text: '48.605',
                          style: appTextTheme.bodyMedium!
                              .copyWith(color: Colors.black))
                    ]),
              ),
              RichText(
                text: TextSpan(
                    text: 'Piece:  ',
                    style: appTextTheme.displaySmall!
                        .copyWith(color: const Color.fromARGB(255, 95, 94, 94)),
                    children: [
                      TextSpan(
                          text: '3',
                          style: appTextTheme.bodyMedium!
                              .copyWith(color: Colors.black))
                    ]),
              ),
            ],
          ),
          ElevatedCutsomBtn(
            width: 130,
            height: 42,
            child: Text(
              'Place Order',
              style: appTextTheme.labelLarge,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderPlacedScreen(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
