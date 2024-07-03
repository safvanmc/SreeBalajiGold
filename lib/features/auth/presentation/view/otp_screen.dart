import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/auth/presentation/provider/auth_provider.dart';
import 'package:sree_balagi_gold/features/splash_screen.dart/presentation/view/splash_screen.dart';
import 'package:sree_balagi_gold/general/service/custom_toast.dart';
import 'package:sree_balagi_gold/general/service/easy_navigator.dart';
import 'package:sree_balagi_gold/general/service/show_progress.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_icons.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_button.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.isRegister});
  final bool isRegister;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, state, _) {
      return Scaffold(
        backgroundColor: AppColors.kwhiteColor,
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
                    AppIcons.otpImage,
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
                    'Enter the OTp sent to +91 ${state.phoneNumberController.text}',
                    style:
                        appTextTheme.bodySmall!.copyWith(color: Colors.black),
                  ),
                  const Gap(30),
                  Pinput(
                    keyboardType: TextInputType.number,
                    controller: controller,
                    length: 6,
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
                          width: 1,
                        ),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                        width: 44,
                        height: 44,
                        textStyle:
                            const TextStyle(fontSize: 18, color: Colors.black),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.black))),
                    closeKeyboardWhenCompleted: true,
                    autofocus: true,
                    pinAnimationType: PinAnimationType.scale,
                    animationDuration: const Duration(milliseconds: 400),
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t receive OTP?',
                        style: appTextTheme.bodySmall!
                            .copyWith(color: Colors.black),
                      ),
                      if (state.isVisibleReSendButton)
                        TextButton(
                          onPressed: () {
                            showProgress(context);
                            state.verifyPhoneNumber(
                              isRegister: widget.isRegister,
                              failure: (error) {
                                Navigator.pop(context);
                                CToast.errorMessage(
                                  context,
                                  description: error,
                                );
                              },
                              sendOTP: () {
                                Navigator.pop(context);
                                state.visibleReSendButton(false);
                                CToast.successMessage(
                                  context,
                                  description:
                                      'OTP has been resent successfully!',
                                );
                              },
                            );
                          },
                          child: const Text(
                            'Resend',
                            style: TextStyle(
                              color: Color(0xFFFF0000),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFFFF0000),
                              height: 0,
                            ),
                          ),
                        )
                      else
                        Row(
                          children: [
                            const Gap(5),
                            Countdown(
                              seconds: 60,
                              build: (BuildContext context, double time) =>
                                  Text(
                                time.toInt().toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffF74646),
                                ),
                              ),
                              onFinished: () {
                                state.visibleReSendButton(true);
                              },
                            ),
                          ],
                        ),
                    ],
                  ),
                  const Gap(10),
                  CButton(
                    child: Text(
                      'Verify',
                      style: appTextTheme.labelLarge!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (controller.text.length == 6) {
                        verifyOtp(state);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void verifyOtp(AuthProvider state) {
    showProgress(context);
    state.verifyOtp(
      otp: controller.text,
      failure: (value) {
        Navigator.pop(context);
        CToast.errorMessage(
          context,
          description: value,
        );
      },
      success: () {
        Navigator.pop(context);
        CToast.successMessage(
          context,
          description: 'Verification successfully completed',
        );
        EasyNavigator.pushAndRemoveUntil(
          context,
          child: const SplashScreen(),
        );
      },
    );
  }
}
