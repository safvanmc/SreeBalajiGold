import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/app_root.dart';
import 'package:sree_balagi_gold/general/service/easy_navigator.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_icons.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_button.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
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
                AppIcons.tick,
                height: 100,
                width: 100,
              )
            ],
          ),
        ),
        //bottom back button//
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15),
          child: CButton(
            color: AppColors.kBottonColor,
            child: Text(
              'Back to Home',
              style: appTextTheme.labelLarge!.copyWith(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              EasyNavigator.pushAndRemoveUntil(
                context,
                child: const AppRoot(
                  currentIndex: 0,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
