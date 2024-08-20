import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/cart/presentation/provider/cart_provider.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_button.dart';

class TotalPriceSection extends StatelessWidget {
  const TotalPriceSection({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, state, _) => Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        color: AppColors.primaryColor.withOpacity(0.1),
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
                      style: appTextTheme.displaySmall!.copyWith(
                          color: const Color.fromARGB(255, 95, 94, 94)),
                      children: [
                        TextSpan(
                            text: state.totalGrossWeight.toString(),
                            style: appTextTheme.bodyMedium!
                                .copyWith(color: Colors.black))
                      ]),
                ),
                const Gap(8),
                RichText(
                  text: TextSpan(
                      text: 'Net Weight:  ',
                      style: appTextTheme.displaySmall!.copyWith(
                          color: const Color.fromARGB(255, 95, 94, 94)),
                      children: [
                        TextSpan(
                            text: state.totalNetWeight.toString(),
                            style: appTextTheme.bodyMedium!
                                .copyWith(color: Colors.black))
                      ]),
                ),
                // RichText(
                //   text: TextSpan(
                //       text: 'Piece:  ',
                //       style: appTextTheme.displaySmall!.copyWith(
                //           color: const Color.fromARGB(255, 95, 94, 94)),
                //       children: [
                //         TextSpan(
                //             text: state.totalPieces.toString(),
                //             style: appTextTheme.bodyMedium!
                //                 .copyWith(color: Colors.black))
                //       ]),
                // ),
              ],
            ),
            CButton(
              width: 130,
              height: 42,
              color: AppColors.kBottonColor,
              onPressed: onPressed,
              child: Text(
                'Place Order',
                style: appTextTheme.labelLarge!.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
