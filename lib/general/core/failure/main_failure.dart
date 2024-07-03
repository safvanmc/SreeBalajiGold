import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_failure.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
  const factory MainFailure.serverFailure({required String msg}) =
      _ServerFailure;
  const factory MainFailure.noData({required String msg}) = NoData;
  const factory MainFailure.unknownFailure({required String msg}) =
      _UnknownFailure;
  const factory MainFailure.localStorageFailure({required String msg}) =
      _LocalStorageFailure;
 
  const factory MainFailure.createUserNameFailure({required String msg}) =
      _CreateUserNameFailure;

  // AuthFailure
  const factory MainFailure.authFailure({required String msg}) = _AuthFailure;
  // UserFailure
  const factory MainFailure.userFailure({required String msg}) = _UserFailure;
  //FirebaseStorageFailure
  const factory MainFailure.firebaseStorageFailure({required String msg}) =
      _FirebaseStorageFailure;
}
