import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/app_roots/presentastion/view/app_root_screen.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_images.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_elevated_btn.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your order is being processed \nand we will call you shortly',
              textAlign: TextAlign.center,
              style: appTextTheme.labelSmall!.copyWith(
                  color: const Color.fromARGB(255, 121, 120, 120),
                  fontSize: 16),
            ),
            const Gap(30),
            Image.asset(
              tick,
              height: 100,
              width: 100,
            )
          ],
        ),
      ),
      //bottom back button//
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: ElevatedCutsomBtn(
          child: Text(
            'Back to Home',
            style: appTextTheme.labelLarge,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const AppRootScreen(
                  index: 0,
                ),
              ),
              (route) => false,
            );
          },
        ),
      ),
    );
  }
}
