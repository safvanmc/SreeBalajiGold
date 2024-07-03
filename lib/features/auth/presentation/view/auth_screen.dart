import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/auth/presentation/provider/auth_provider.dart';
import 'package:sree_balagi_gold/features/auth/presentation/view/otp_screen.dart';
import 'package:sree_balagi_gold/general/service/custom_toast.dart';
import 'package:sree_balagi_gold/general/service/easy_navigator.dart';
import 'package:sree_balagi_gold/general/service/show_progress.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_icons.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_button.dart';
import 'package:sree_balagi_gold/general/widgets/custom_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.isRegister});
  final bool isRegister;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kwhiteColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Consumer<AuthProvider>(builder: (context, state, _) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(100),
                  Image.asset(
                    AppIcons.loginImage,
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
                    'We will send you  the 6 digit verification code',
                    style:
                        appTextTheme.bodySmall!.copyWith(color: Colors.black),
                  ),
                  const Gap(50),
                  Form(
                    key: formKey,
                    child: CTextField(
                      controller: state.phoneNumberController,
                      keyboardType: TextInputType.phone,
                      label: const Text('Phone number'),
                      maxLength: 10,
                      hintText: 'enter your phone number',
                      validator: (value) {
                        if ((value ?? '').isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (value!.length < 10) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(
                          top: 1,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '+91',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(40),
                  CButton(
                    child: Text(
                      'Get Otp',
                      style: appTextTheme.labelLarge!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      showProgress(context);
                      state.verifyPhoneNumber(
                        isRegister: widget.isRegister,
                        failure: (e) {
                          EasyNavigator.pop(context);
                          CToast.errorMessage(
                            context,
                            description: e,
                          );
                        },
                        sendOTP: () {
                          EasyNavigator.pop(context);
                          EasyNavigator.push(
                            context,
                            child: OtpScreen(
                              isRegister: widget.isRegister,
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const Gap(10),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
