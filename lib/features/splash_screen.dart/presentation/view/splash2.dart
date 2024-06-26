import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/authentication/presentation/view/screens/login_screen.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_images.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_elevated_btn.dart';

class AboutAndRegiSter extends StatelessWidget {
  const AboutAndRegiSter({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: kwhiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(mq.height / 6),
                Image.asset(
                  goldPot,
                  height: 155,
                  width: 171,
                ),
                const Gap(30),
                Text(
                  'What Is Sree Balaji Gold?',
                  style: appTextTheme.bodyMedium!
                      .copyWith(fontSize: 14, color: kBottonColor),
                ),
                const Gap(25),
                Text(
                    textAlign: TextAlign.center,
                    style: appTextTheme.displaySmall,
                    'We\'re excited to introduce the new Jimmki! Experience innovative features and enhanced performance that redefine your expectations.'),
                const Gap(120),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Already have an account',
                      style: appTextTheme.displayMedium,
                    )),
                const Gap(15),
                ElevatedCutsomBtn(
                  child: Text(
                    'Register',
                    style: appTextTheme.labelLarge,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  },
                )
              ]),
        ),
      ),
    );
  }
}
