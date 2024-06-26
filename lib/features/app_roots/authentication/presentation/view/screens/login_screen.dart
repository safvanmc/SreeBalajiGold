import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/authentication/presentation/view/screens/otp_screen.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_images.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_elevated_btn.dart';
import 'package:sree_balagi_gold/general/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhiteColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(100),
                Image.asset(
                  loginImage,
                  height: 145,
                  width: 150,
                ),
                const Gap(40),
                Text(
                  'Enter Your Registered Number',
                  style: appTextTheme.labelMedium,
                ),
                const Gap(10),
                Text(
                  'We will send you  the 4 digit verification code',
                  style: appTextTheme.bodySmall!.copyWith(color: Colors.black),
                ),
                const Gap(50),
                const CustomTextForm(
                  keyboardType: TextInputType.number,
                  label: Text('Phone Number'),
                  hintText: 'enter your registered number',
                ),
                const Gap(40),
                ElevatedCutsomBtn(
                  child: Text(
                    'Get Otp',
                    style: appTextTheme.labelLarge,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtpScreen(),
                        ));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
