import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/auth/presentation/view/auth_screen.dart';
import 'package:sree_balagi_gold/features/auth/presentation/view/registration_screen.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_icons.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_button.dart';

class RegisterOrLoginScreen extends StatelessWidget {
  const RegisterOrLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.kwhiteColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(mq.height / 6),
                  Image.asset(
                    AppIcons.goldPot,
                    height: 155,
                    width: 171,
                  ),
                  const Gap(30),
                  Text(
                    'What Is Sree Balaji Gold?',
                    style: appTextTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      color: AppColors.kBottonColor,
                    ),
                  ),
                  const Gap(25),
                  Opacity(
                    opacity: 0.70,
                    child: Text(
                      textAlign: TextAlign.center,
                      style: appTextTheme.displaySmall!.copyWith(
                        color: const Color(0xFF333333),
                        letterSpacing: 0.24,
                      ),
                      'We\'re excited to introduce the new Jimmki! Experience innovative features and enhanced performance that redefine your expectations.',
                    ),
                  ),
                  const Gap(120),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AuthScreen(
                              isRegister: false,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Already have an account',
                        style: appTextTheme.displayMedium,
                      )),
                  const Gap(15),
                  CButton(
                    child: Text(
                      'Register',
                      style: appTextTheme.labelLarge!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrationScreen(),
                        ),
                      );
                    },
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
