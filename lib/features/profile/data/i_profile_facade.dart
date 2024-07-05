import 'package:dartz/dartz.dart';
import 'package:sree_balagi_gold/features/auth/data/model/user_model.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';

abstract class IProfileFacade {
  FutureResult<Unit> updateProfile(UserModel userModel) {
    throw UnimplementedError('update profile');
  }
}
