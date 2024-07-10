import 'dart:core';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/app_root.dart';
import 'package:sree_balagi_gold/features/auth/presentation/provider/auth_provider.dart';
import 'package:sree_balagi_gold/features/auth/presentation/view/pending_verification_screen.dart';
import 'package:sree_balagi_gold/features/auth/presentation/view/register_or_login_screen.dart';
import 'package:sree_balagi_gold/features/auth/presentation/view/rejected_approval_screen.dart';
import 'package:sree_balagi_gold/features/banner/presentation/provider/banner_provider.dart';
import 'package:sree_balagi_gold/general/service/easy_navigator.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_icons.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double scaleFactor = 1;
  bool isChanged = true;
  bool isFinished = false;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween<double>(begin: 0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1.0, curve: Curves.easeOut)));
    _controller.forward().then(
      (value) {
        circleTransition();
      },
    );
    context.read<AuthProvider>().fetchUser();
    context.read<BannerProvider>().fetchBanner();

    super.initState();
  }

  Future<void> circleTransition() async {
    for (var i = 0; i < 100; i++) {
      await Future.delayed(
        const Duration(milliseconds: 1),
        () {
          setState(() {
            scaleFactor += 0.2;
            isChanged = false;
          });
        },
      );
    }
    setState(() {
      isFinished = true;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.kwhiteColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Gap(mq.height / 5),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Transform.scale(
                scale: scaleFactor,
                child: const CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.primaryColor,
                ),
              ),
            ),
            Center(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                      AppIcons.appIcon,
                    ),
                  ),
                  color: isChanged
                      ? AppColors.kwhiteColor
                      : AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
        const Gap(10),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _animation.value,
              child: Text(
                'SREE BALAJI GOLD',
                style: appTextTheme.bodyMedium!.copyWith(
                  color: isChanged
                      ? AppColors.primaryColor
                      : AppColors.kwhiteColor,
                ),
              ),
            );
          },
        ),
        Gap(mq.height / 4),
        isFinished
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CButton(
                    height: 40,
                    width: 150,
                    color: AppColors.secondaryColor,
                    onPressed: () {
                      init();
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Explore With Us',
                          style: appTextTheme.bodySmall!
                              .copyWith(color: AppColors.kwhiteColor),
                        ),
                        const Gap(5),
                        const Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 15,
                          color: AppColors.kwhiteColor,
                        )
                      ],
                    ),
                  ),
                ],
              )
            : const SizedBox(
                height: 40,
              )
      ]),
    );
  }

  void init() {
    final userModel = context.read<AuthProvider>().userModel;

    if (userModel == null) {
      EasyNavigator.pushReplacement(
        context,
        child: const RegisterOrLoginScreen(),
      );
      return;
    }
    context.read<AuthProvider>().setLastAppOpenTime();
    if (userModel.accountStatusIndex == 0) {
      EasyNavigator.pushReplacement(
        context,
        child: const PendingVerificationScreen(),
      );
      return;
    }
    if (userModel.accountStatusIndex == 1) {
      EasyNavigator.pushReplacement(
        context,
        child: const AppRoot(),
      );

      return;
    }
    if (userModel.accountStatusIndex == 2) {
      EasyNavigator.pushReplacement(
        context,
        child: const RejectedApprovalScreen(),
      );
      return;
    }
  }
}
