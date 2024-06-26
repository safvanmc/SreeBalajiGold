import 'dart:core';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/splash_screen.dart/presentation/view/splash2.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_images.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_elevated_btn.dart';

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
        // setState(() {
        //   isFinished = true;
        // });
      },
    );

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
      // isChanged = false;
      isFinished = true;
    });
  }

  // Route createRoute() {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) =>
  //         const SplashScreen2(),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       const curve = Curves.fastEaseInToSlowEaseOut;
  //       final curvedAnimation =
  //           CurvedAnimation(parent: animation, curve: curve);
  //       return ScaleTransition(
  //         scale: curvedAnimation,
  //         child: child,
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: kwhiteColor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(mq.height / 5),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Center(
                  child: Transform.scale(
                    scale: scaleFactor,
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundColor: primaryColor,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              logo,
                            ),
                            fit: BoxFit.fill),
                        color: isChanged ? kwhiteColor : primaryColor,
                        borderRadius: BorderRadius.circular(30)),
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
                        color: isChanged ? primaryColor : kwhiteColor),
                  ),
                );
              },
            ),
            Gap(mq.height / 4),
            isFinished
                ? ElevatedCutsomBtn(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: const Offset(0.2, 3),
                          color: secondaryColor.withOpacity(0.5))
                    ]),
                    color: secondaryColor,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const AboutAndRegiSter(),
                      ));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Explore With Us',
                          style: appTextTheme.bodySmall!
                              .copyWith(color: kwhiteColor),
                        ),
                        const Gap(5),
                        const Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 15,
                          color: kwhiteColor,
                        )
                      ],
                    ),
                  )
                : const SizedBox(
                    height: 40,
                  )
          ]),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
