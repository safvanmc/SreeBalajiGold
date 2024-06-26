import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:sree_balagi_gold/features/registration/presentation/view/screens/registration_screen.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_images.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_elevated_btn.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                  otpImage,
                  height: 145,
                  width: 150,
                ),
                const Gap(40),
                Text(
                  'OTP Verification',
                  style: appTextTheme.labelMedium,
                ),
                const Gap(10),
                Text(
                  'Enter the OTp sent to +91 9987654321',
                  style: appTextTheme.bodySmall!.copyWith(color: Colors.black),
                ),
                const Gap(30),
                Pinput(
                  // controller: otpProvider.otpController,
                  keyboardType: TextInputType.number,
                  length: 4,
                  defaultPinTheme: PinTheme(
                      width: 46,
                      height: 43,
                      textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: Colors.black.withOpacity(0.15),
                              width: 1))),
                  focusedPinTheme: PinTheme(
                      width: 44,
                      height: 44,
                      textStyle:
                          const TextStyle(fontSize: 18, color: Colors.black),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black))),
                  // androidSmsAutofillMethod:
                  //     AndroidSmsAutofillMethod.smsRetrieverApi,
                  closeKeyboardWhenCompleted: true,
                  autofocus: true,
                  pinAnimationType: PinAnimationType.scale,
                  animationDuration: const Duration(milliseconds: 400),
                ),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t receive OTP?',
                      style:
                          appTextTheme.bodySmall!.copyWith(color: Colors.black),
                    ),
                    const Text(
                      'Resend',
                      style: TextStyle(
                        color: Color(0xFFFF0000),
                        fontSize: 12,
                        fontFamily: 'Axiforma',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFFF0000),
                        height: 0,
                      ),
                    )
                  ],
                ),
                const Gap(22),
                ElevatedCutsomBtn(
                  child: Text(
                    'Verify',
                    style: appTextTheme.labelLarge,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrationScreen(),
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
