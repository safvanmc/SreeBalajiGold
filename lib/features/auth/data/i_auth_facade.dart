import 'package:dartz/dartz.dart';
import 'package:sree_balagi_gold/features/auth/data/model/user_model.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';

abstract class IAuthFacade {
  StreamResult veryfyPhoneNumber({
    required bool isRegister,
    required String phoneNumber,
  }) async* {
    throw UnimplementedError('veryfyPhoneNumber() Not implemented');
  }

  FutureResult<Unit> veryfyOtp({
    required String otp,
    required UserModel userModel,
  }) async {
    throw UnimplementedError('veryfyOtp() Not implemented');
  }

  void clearData() {
    throw UnimplementedError('clearData() Not implemented');
  }

  Stream<UserModel?> fetchUser() async* {
    throw UnimplementedError("fetchUser() Not implemented");
  }

  FutureResult<Unit> setLastAppOpenTime() async {
    throw UnimplementedError('lastAppOpenTime() Not implemented');
  }
}
