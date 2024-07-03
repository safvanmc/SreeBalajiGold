import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/features/auth/data/i_auth_facade.dart';
import 'package:sree_balagi_gold/features/auth/data/model/user_model.dart';
import 'package:sree_balagi_gold/general/service/keywords_builder.dart';
import 'package:sree_balagi_gold/general/utils/app_details.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider(this._iAuthFacade);
  UserModel? userModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController shopAddressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final IAuthFacade _iAuthFacade;
  bool isVisibleReSendButton = false;

  void verifyPhoneNumber({
    required bool isRegister,
    required void Function(String) failure,
    required void Function() sendOTP,
  }) {
    _iAuthFacade
        .veryfyPhoneNumber(
      isRegister: isRegister,
      phoneNumber: phoneNumberController.text.trim(),
    )
        .listen((result) {
      result.fold(
        (error) {
          failure.call(
            error.msg,
          );
        },
        (success) {
          sendOTP.call();
        },
      );
    });
  }

  Future<void> verifyOtp({
    required String otp,
    required void Function(String) failure,
    required void Function() success,
  }) async {
    final result = await _iAuthFacade.veryfyOtp(
      otp: otp,
      userModel: _createUserModel,
    );
    result.fold(
      (l) {
        failure.call(l.msg);
      },
      (r) {
        success.call();
      },
    );
  }

  UserModel get _createUserModel {
    return UserModel(
      phoneNumber: '${AppDetails.countryCode}${phoneNumberController.text}',
      accountStatusIndex: 0,
      isBlocked: false,
      name: nameController.text.trim(),
      nameKeyword: KeywordsBuilder.advanceKeywordsBuilder(
        nameController.text.trim(),
      ),
      shopName: shopNameController.text.trim(),
      shopNameKeyword: KeywordsBuilder.advanceKeywordsBuilder(
        shopNameController.text.trim(),
      ),
      shopAddress: shopAddressController.text,
      favorites: [],
    );
  }

  void visibleReSendButton(bool isVisibleReSendButton) {
    this.isVisibleReSendButton = isVisibleReSendButton;
    notifyListeners();
  }

  void clearData() {
    nameController.clear();
    shopNameController.clear();
    shopAddressController.clear();
    phoneNumberController.clear();
    _iAuthFacade.clearData();
    notifyListeners();
  }

  void fetchUser() {
    final result = _iAuthFacade.fetchUser();
    result.listen((event) {
      userModel = event;
    });
  }

  Future<void> setLastAppOpenTime() async {
    await _iAuthFacade.setLastAppOpenTime();
  }
}
