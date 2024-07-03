import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/auth/presentation/provider/auth_provider.dart';
import 'package:sree_balagi_gold/features/auth/presentation/view/auth_screen.dart';
import 'package:sree_balagi_gold/general/service/easy_navigator.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_button.dart';
import 'package:sree_balagi_gold/general/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<AuthProvider>().clearData();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register Your Account',
          style: appTextTheme.titleLarge!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Consumer<AuthProvider>(builder: (context, state, _) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(20),
                          CTextField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: state.nameController,
                            label: const Text('Name'),
                            hintText: 'enter your name',
                            validator: (value) {
                              if ((value ?? '').isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            },
                          ),
                          const Gap(26),
                          CTextField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: state.shopNameController,
                            label: const Text('Shop Name'),
                            hintText: 'enter your shope name',
                            validator: (value) {
                              if ((value ?? '').isEmpty) {
                                return 'Please enter shop Name';
                              }
                              return null;
                            },
                          ),
                          const Gap(26),
                          CTextField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: state.shopAddressController,
                            label: const Text('Shope Address'),
                            hintText: 'enter your shope adress',
                            validator: (value) {
                              if ((value ?? '').isEmpty) {
                                return 'Please enter shope adress';
                              }
                              return null;
                            },
                          ),
                          const Gap(26),
                          CTextField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: state.phoneNumberController,
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            label: const Text('Phone number'),
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
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(10),
                CButton(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    'Continue',
                    style: appTextTheme.labelLarge!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    if (!formKey.currentState!.validate()) return;
                    EasyNavigator.push(
                      context,
                      child: const AuthScreen(
                        isRegister: true,
                      ),
                    );
                  },
                ),
                const Gap(10)
              ],
            ),
          ),
        );
      }),
    );
  }
}
