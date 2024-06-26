import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/app_roots/presentastion/view/app_root_screen.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_elevated_btn.dart';
import 'package:sree_balagi_gold/general/widgets/custom_text_field.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhiteColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(70),
                Text('Register Your Account', style: appTextTheme.titleLarge),
                const Gap(35),
                const CustomTextForm(
                  label: Text('Name'),
                  hintText: 'enter your name',
                ),
                const Gap(26),
                const CustomTextForm(
                  label: Text('Shop Name'),
                  hintText: 'enter your shope name',
                ),
                const Gap(26),
                const CustomTextForm(
                  label: Text('Shope Address'),
                  hintText: 'enter your shope adress',
                ),
                const Gap(26),
                const CustomTextForm(
                  label: Text('Mobile Number'),
                  hintText: 'enter your mobile number',
                ),
                const Gap(250),
                ElevatedCutsomBtn(
                  child: Text(
                    'Send Request',
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
                const Gap(20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
