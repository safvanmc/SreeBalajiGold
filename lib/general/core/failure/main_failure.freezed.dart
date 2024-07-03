// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainFailure {
  String get msg => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String msg) serverFailure,
    required TResult Function(String msg) noData,
    required TResult Function(String msg) unknownFailure,
    required TResult Function(String msg) localStorageFailure,
    required TResult Function(String msg) createUserNameFailure,
    required TResult Function(String msg) authFailure,
    required TResult Function(String msg) userFailure,
    required TResult Function(String msg) firebaseStorageFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String msg)? serverFailure,
    TResult? Function(String msg)? noData,
    TResult? Function(String msg)? unknownFailure,
    TResult? Function(String msg)? localStorageFailure,
    TResult? Function(String msg)? createUserNameFailure,
    TResult? Function(String msg)? authFailure,
    TResult? Function(String msg)? userFailure,
    TResult? Function(String msg)? firebaseStorageFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String msg)? serverFailure,
    TResult Function(String msg)? noData,
    TResult Function(String msg)? unknownFailure,
    TResult Function(String msg)? localStorageFailure,
    TResult Function(String msg)? createUserNameFailure,
    TResult Function(String msg)? authFailure,
    TResult Function(String msg)? userFailure,
    TResult Function(String msg)? firebaseStorageFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(NoData value) noData,
    required TResult Function(_UnknownFailure value) unknownFailure,
    required TResult Function(_LocalStorageFailure value) localStorageFailure,
    required TResult Function(_CreateUserNameFailure value)
        createUserNameFailure,
    required TResult Function(_AuthFailure value) authFailure,
    required TResult Function(_UserFailure value) userFailure,
    required TResult Function(_FirebaseStorageFailure value)
        firebaseStorageFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(NoData value)? noData,
    TResult? Function(_UnknownFailure value)? unknownFailure,
    TResult? Function(_LocalStorageFailure value)? localStorageFailure,
    TResult? Function(_CreateUserNameFailure value)? createUserNameFailure,
    TResult? Function(_AuthFailure value)? authFailure,
    TResult? Function(_UserFailure value)? userFailure,
    TResult? Function(_FirebaseStorageFailure value)? firebaseStorageFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(NoData value)? noData,
    TResult Function(_UnknownFailure value)? unknownFailure,
    TResult Function(_LocalStorageFailure value)? localStorageFailure,
    TResult Function(_CreateUserNameFailure value)? createUserNameFailure,
    TResult Function(_AuthFailure value)? authFailure,
    TResult Function(_UserFailure value)? userFailure,
    TResult Function(_FirebaseStorageFailure value)? firebaseStorageFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainFailureCopyWith<MainFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainFailureCopyWith<$Res> {
  factory $MainFailureCopyWith(
          MainFailure value, $Res Function(MainFailure) then) =
      _$MainFailureCopyWithImpl<$Res, MainFailure>;
  @useResult
  $Res call({String msg});
}

/// @nodoc
class _$MainFailureCopyWithImpl<$Res, $Val extends MainFailure>
    implements $MainFailureCopyWith<$Res> {
  _$MainFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_value.copyWith(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerFailureImplCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
          _$ServerFailureImpl value, $Res Function(_$ServerFailureImpl) then) =
      __$$ServerFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
      _$ServerFailureImpl _value, $Res Function(_$ServerFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$ServerFailureImpl(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerFailureImpl implements _ServerFailure {
  const _$ServerFailureImpl({required this.msg});

  @override
  final String msg;

  @override
  String toString() {
    return 'MainFailure.serverFailure(msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailureImpl &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      __$$ServerFailureImplCopyWithImpl<_$ServerFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String msg) serverFailure,
    required TResult Function(String msg) noData,
    required TResult Function(String msg) unknownFailure,
    required TResult Function(String msg) localStorageFailure,
    required TResult Function(String msg) createUserNameFailure,
    required TResult Function(String msg) authFailure,
    required TResult Function(String msg) userFailure,
    required TResult Function(String msg) firebaseStorageFailure,
  }) {
    return serverFailure(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String msg)? serverFailure,
    TResult? Function(String msg)? noData,
    TResult? Function(String msg)? unknownFailure,
    TResult? Function(String msg)? localStorageFailure,
    TResult? Function(String msg)? createUserNameFailure,
    TResult? Function(String msg)? authFailure,
    TResult? Function(String msg)? userFailure,
    TResult? Function(String msg)? firebaseStorageFailure,
  }) {
    return serverFailure?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String msg)? serverFailure,
    TResult Function(String msg)? noData,
    TResult Function(String msg)? unknownFailure,
    TResult Function(String msg)? localStorageFailure,
    TResult Function(String msg)? createUserNameFailure,
    TResult Function(String msg)? authFailure,
    TResult Function(String msg)? userFailure,
    TResult Function(String msg)? firebaseStorageFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(NoData value) noData,
    required TResult Function(_UnknownFailure value) unknownFailure,
    required TResult Function(_LocalStorageFailure value) localStorageFailure,
    required TResult Function(_CreateUserNameFailure value)
        createUserNameFailure,
    required TResult Function(_AuthFailure value) authFailure,
    required TResult Function(_UserFailure value) userFailure,
    required TResult Function(_FirebaseStorageFailure value)
        firebaseStorageFailure,
  }) {
    return serverFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(NoData value)? noData,
    TResult? Function(_UnknownFailure value)? unknownFailure,
    TResult? Function(_LocalStorageFailure value)? localStorageFailure,
    TResult? Function(_CreateUserNameFailure value)? createUserNameFailure,
    TResult? Function(_AuthFailure value)? authFailure,
    TResult? Function(_UserFailure value)? userFailure,
    TResult? Function(_FirebaseStorageFailure value)? firebaseStorageFailure,
  }) {
    return serverFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(NoData value)? noData,
    TResult Function(_UnknownFailure value)? unknownFailure,
    TResult Function(_LocalStorageFailure value)? localStorageFailure,
    TResult Function(_CreateUserNameFailure value)? createUserNameFailure,
    TResult Function(_AuthFailure value)? authFailure,
    TResult Function(_UserFailure value)? userFailure,
    TResult Function(_FirebaseStorageFailure value)? firebaseStorageFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(this);
    }
    return orElse();
  }
}

abstract class _ServerFailure implements MainFailure {
  const factory _ServerFailure({required final String msg}) =
      _$ServerFailureImpl;

  @override
  String get msg;
  @override
  @JsonKey(ignore: true)
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoDataImplCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$$NoDataImplCopyWith(
          _$NoDataImpl value, $Res Function(_$NoDataImpl) then) =
      __$$NoDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$NoDataImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$NoDataImpl>
    implements _$$NoDataImplCopyWith<$Res> {
  __$$NoDataImplCopyWithImpl(
      _$NoDataImpl _value, $Res Function(_$NoDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$NoDataImpl(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NoDataImpl implements NoData {
  const _$NoDataImpl({required this.msg});

  @override
  final String msg;

  @override
  String toString() {
    return 'MainFailure.noData(msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoDataImpl &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoDataImplCopyWith<_$NoDataImpl> get copyWith =>
      __$$NoDataImplCopyWithImpl<_$NoDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String msg) serverFailure,
    required TResult Function(String msg) noData,
    required TResult Function(String msg) unknownFailure,
    required TResult Function(String msg) localStorageFailure,
    required TResult Function(String msg) createUserNameFailure,
    required TResult Function(String msg) authFailure,
    required TResult Function(String msg) userFailure,
    required TResult Function(String msg) firebaseStorageFailure,
  }) {
    return noData(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String msg)? serverFailure,
    TResult? Function(String msg)? noData,
    TResult? Function(String msg)? unknownFailure,
    TResult? Function(String msg)? localStorageFailure,
    TResult? Function(String msg)? createUserNameFailure,
    TResult? Function(String msg)? authFailure,
    TResult? Function(String msg)? userFailure,
    TResult? Function(String msg)? firebaseStorageFailure,
  }) {
    return noData?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String msg)? serverFailure,
    TResult Function(String msg)? noData,
    TResult Function(String msg)? unknownFailure,
    TResult Function(String msg)? localStorageFailure,
    TResult Function(String msg)? createUserNameFailure,
    TResult Function(String msg)? authFailure,
    TResult Function(String msg)? userFailure,
    TResult Function(String msg)? firebaseStorageFailure,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(NoData value) noData,
    required TResult Function(_UnknownFailure value) unknownFailure,
    required TResult Function(_LocalStorageFailure value) localStorageFailure,
    required TResult Function(_CreateUserNameFailure value)
        createUserNameFailure,
    required TResult Function(_AuthFailure value) authFailure,
    required TResult Function(_UserFailure value) userFailure,
    required TResult Function(_FirebaseStorageFailure value)
        firebaseStorageFailure,
  }) {
    return noData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(NoData value)? noData,
    TResult? Function(_UnknownFailure value)? unknownFailure,
    TResult? Function(_LocalStorageFailure value)? localStorageFailure,
    TResult? Function(_CreateUserNameFailure value)? createUserNameFailure,
    TResult? Function(_AuthFailure value)? authFailure,
    TResult? Function(_UserFailure value)? userFailure,
    TResult? Function(_FirebaseStorageFailure value)? firebaseStorageFailure,
  }) {
    return noData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(NoData value)? noData,
    TResult Function(_UnknownFailure value)? unknownFailure,
    TResult Function(_LocalStorageFailure value)? localStorageFailure,
    TResult Function(_CreateUserNameFailure value)? createUserNameFailure,
    TResult Function(_AuthFailure value)? authFailure,
    TResult Function(_UserFailure value)? userFailure,
    TResult Function(_FirebaseStorageFailure value)? firebaseStorageFailure,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(this);
    }
    return orElse();
  }
}

abstract class NoData implements MainFailure {
  const factory NoData({required final String msg}) = _$NoDataImpl;

  @override
  String get msg;
  @override
  @JsonKey(ignore: true)
  _$$NoDataImplCopyWith<_$NoDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownFailureImplCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$$UnknownFailureImplCopyWith(_$UnknownFailureImpl value,
          $Res Function(_$UnknownFailureImpl) then) =
      __$$UnknownFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$UnknownFailureImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$UnknownFailureImpl>
    implements _$$UnknownFailureImplCopyWith<$Res> {
  __$$UnknownFailureImplCopyWithImpl(
      _$UnknownFailureImpl _value, $Res Function(_$UnknownFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$UnknownFailureImpl(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnknownFailureImpl implements _UnknownFailure {
  const _$UnknownFailureImpl({required this.msg});

  @override
  final String msg;

  @override
  String toString() {
    return 'MainFailure.unknownFailure(msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownFailureImpl &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      __$$UnknownFailureImplCopyWithImpl<_$UnknownFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String msg) serverFailure,
    required TResult Function(String msg) noData,
    required TResult Function(String msg) unknownFailure,
    required TResult Function(String msg) localStorageFailure,
    required TResult Function(String msg) createUserNameFailure,
    required TResult Function(String msg) authFailure,
    required TResult Function(String msg) userFailure,
    required TResult Function(String msg) firebaseStorageFailure,
  }) {
    return unknownFailure(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String msg)? serverFailure,
    TResult? Function(String msg)? noData,
    TResult? Function(String msg)? unknownFailure,
    TResult? Function(String msg)? localStorageFailure,
    TResult? Function(String msg)? createUserNameFailure,
    TResult? Function(String msg)? authFailure,
    TResult? Function(String msg)? userFailure,
    TResult? Function(String msg)? firebaseStorageFailure,
  }) {
    return unknownFailure?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String msg)? serverFailure,
    TResult Function(String msg)? noData,
    TResult Function(String msg)? unknownFailure,
    TResult Function(String msg)? localStorageFailure,
    TResult Function(String msg)? createUserNameFailure,
    TResult Function(String msg)? authFailure,
    TResult Function(String msg)? userFailure,
    TResult Function(String msg)? firebaseStorageFailure,
    required TResult orElse(),
  }) {
    if (unknownFailure != null) {
      return unknownFailure(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(NoData value) noData,
    required TResult Function(_UnknownFailure value) unknownFailure,
    required TResult Function(_LocalStorageFailure value) localStorageFailure,
    required TResult Function(_CreateUserNameFailure value)
        createUserNameFailure,
    required TResult Function(_AuthFailure value) authFailure,
    required TResult Function(_UserFailure value) userFailure,
    required TResult Function(_FirebaseStorageFailure value)
        firebaseStorageFailure,
  }) {
    return unknownFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(NoData value)? noData,
    TResult? Function(_UnknownFailure value)? unknownFailure,
    TResult? Function(_LocalStorageFailure value)? localStorageFailure,
    TResult? Function(_CreateUserNameFailure value)? createUserNameFailure,
    TResult? Function(_AuthFailure value)? authFailure,
    TResult? Function(_UserFailure value)? userFailure,
    TResult? Function(_FirebaseStorageFailure value)? firebaseStorageFailure,
  }) {
    return unknownFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(NoData value)? noData,
    TResult Function(_UnknownFailure value)? unknownFailure,
    TResult Function(_LocalStorageFailure value)? localStorageFailure,
    TResult Function(_CreateUserNameFailure value)? createUserNameFailure,
    TResult Function(_AuthFailure value)? authFailure,
    TResult Function(_UserFailure value)? userFailure,
    TResult Function(_FirebaseStorageFailure value)? firebaseStorageFailure,
    required TResult orElse(),
  }) {
    if (unknownFailure != null) {
      return unknownFailure(this);
    }
    return orElse();
  }
}

abstract class _UnknownFailure implements MainFailure {
  const factory _UnknownFailure({required final String msg}) =
      _$UnknownFailureImpl;

  @override
  String get msg;
  @override
  @JsonKey(ignore: true)
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocalStorageFailureImplCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$$LocalStorageFailureImplCopyWith(_$LocalStorageFailureImpl value,
          $Res Function(_$LocalStorageFailureImpl) then) =
      __$$LocalStorageFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$LocalStorageFailureImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$LocalStorageFailureImpl>
    implements _$$LocalStorageFailureImplCopyWith<$Res> {
  __$$LocalStorageFailureImplCopyWithImpl(_$LocalStorageFailureImpl _value,
      $Res Function(_$LocalStorageFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$LocalStorageFailureImpl(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LocalStorageFailureImpl implements _LocalStorageFailure {
  const _$LocalStorageFailureImpl({required this.msg});

  @override
  final String msg;

  @override
  String toString() {
    return 'MainFailure.localStorageFailure(msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalStorageFailureImpl &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalStorageFailureImplCopyWith<_$LocalStorageFailureImpl> get copyWith =>
      __$$LocalStorageFailureImplCopyWithImpl<_$LocalStorageFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String msg) serverFailure,
    required TResult Function(String msg) noData,
    required TResult Function(String msg) unknownFailure,
    required TResult Function(String msg) localStorageFailure,
    required TResult Function(String msg) createUserNameFailure,
    required TResult Function(String msg) authFailure,
    required TResult Function(String msg) userFailure,
    required TResult Function(String msg) firebaseStorageFailure,
  }) {
    return localStorageFailure(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String msg)? serverFailure,
    TResult? Function(String msg)? noData,
    TResult? Function(String msg)? unknownFailure,
    TResult? Function(String msg)? localStorageFailure,
    TResult? Function(String msg)? createUserNameFailure,
    TResult? Function(String msg)? authFailure,
    TResult? Function(String msg)? userFailure,
    TResult? Function(String msg)? firebaseStorageFailure,
  }) {
    return localStorageFailure?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String msg)? serverFailure,
    TResult Function(String msg)? noData,
    TResult Function(String msg)? unknownFailure,
    TResult Function(String msg)? localStorageFailure,
    TResult Function(String msg)? createUserNameFailure,
    TResult Function(String msg)? authFailure,
    TResult Function(String msg)? userFailure,
    TResult Function(String msg)? firebaseStorageFailure,
    required TResult orElse(),
  }) {
    if (localStorageFailure != null) {
      return localStorageFailure(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(NoData value) noData,
    required TResult Function(_UnknownFailure value) unknownFailure,
    required TResult Function(_LocalStorageFailure value) localStorageFailure,
    required TResult Function(_CreateUserNameFailure value)
        createUserNameFailure,
    required TResult Function(_AuthFailure value) authFailure,
    required TResult Function(_UserFailure value) userFailure,
    required TResult Function(_FirebaseStorageFailure value)
        firebaseStorageFailure,
  }) {
    return localStorageFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(NoData value)? noData,
    TResult? Function(_UnknownFailure value)? unknownFailure,
    TResult? Function(_LocalStorageFailure value)? localStorageFailure,
    TResult? Function(_CreateUserNameFailure value)? createUserNameFailure,
    TResult? Function(_AuthFailure value)? authFailure,
    TResult? Function(_UserFailure value)? userFailure,
    TResult? Function(_FirebaseStorageFailure value)? firebaseStorageFailure,
  }) {
    return localStorageFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(NoData value)? noData,
    TResult Function(_UnknownFailure value)? unknownFailure,
    TResult Function(_LocalStorageFailure value)? localStorageFailure,
    TResult Function(_CreateUserNameFailure value)? createUserNameFailure,
    TResult Function(_AuthFailure value)? authFailure,
    TResult Function(_UserFailure value)? userFailure,
    TResult Function(_FirebaseStorageFailure value)? firebaseStorageFailure,
    required TResult orElse(),
  }) {
    if (localStorageFailure != null) {
      return localStorageFailure(this);
    }
    return orElse();
  }
}

abstract class _LocalStorageFailure implements MainFailure {
  const factory _LocalStorageFailure({required final String msg}) =
      _$LocalStorageFailureImpl;

  @override
  String get msg;
  @override
  @JsonKey(ignore: true)
  _$$LocalStorageFailureImplCopyWith<_$LocalStorageFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateUserNameFailureImplCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$$CreateUserNameFailureImplCopyWith(
          _$CreateUserNameFailureImpl value,
          $Res Function(_$CreateUserNameFailureImpl) then) =
      __$$CreateUserNameFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$CreateUserNameFailureImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$CreateUserNameFailureImpl>
    implements _$$CreateUserNameFailureImplCopyWith<$Res> {
  __$$CreateUserNameFailureImplCopyWithImpl(_$CreateUserNameFailureImpl _value,
      $Res Function(_$CreateUserNameFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$CreateUserNameFailureImpl(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateUserNameFailureImpl implements _CreateUserNameFailure {
  const _$CreateUserNameFailureImpl({required this.msg});

  @override
  final String msg;

  @override
  String toString() {
    return 'MainFailure.createUserNameFailure(msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUserNameFailureImpl &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateUserNameFailureImplCopyWith<_$CreateUserNameFailureImpl>
      get copyWith => __$$CreateUserNameFailureImplCopyWithImpl<
          _$CreateUserNameFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String msg) serverFailure,
    required TResult Function(String msg) noData,
    required TResult Function(String msg) unknownFailure,
    required TResult Function(String msg) localStorageFailure,
    required TResult Function(String msg) createUserNameFailure,
    required TResult Function(String msg) authFailure,
    required TResult Function(String msg) userFailure,
    required TResult Function(String msg) firebaseStorageFailure,
  }) {
    return createUserNameFailure(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String msg)? serverFailure,
    TResult? Function(String msg)? noData,
    TResult? Function(String msg)? unknownFailure,
    TResult? Function(String msg)? localStorageFailure,
    TResult? Function(String msg)? createUserNameFailure,
    TResult? Function(String msg)? authFailure,
    TResult? Function(String msg)? userFailure,
    TResult? Function(String msg)? firebaseStorageFailure,
  }) {
    return createUserNameFailure?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String msg)? serverFailure,
    TResult Function(String msg)? noData,
    TResult Function(String msg)? unknownFailure,
    TResult Function(String msg)? localStorageFailure,
    TResult Function(String msg)? createUserNameFailure,
    TResult Function(String msg)? authFailure,
    TResult Function(String msg)? userFailure,
    TResult Function(String msg)? firebaseStorageFailure,
    required TResult orElse(),
  }) {
    if (createUserNameFailure != null) {
      return createUserNameFailure(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(NoData value) noData,
    required TResult Function(_UnknownFailure value) unknownFailure,
    required TResult Function(_LocalStorageFailure value) localStorageFailure,
    required TResult Function(_CreateUserNameFailure value)
        createUserNameFailure,
    required TResult Function(_AuthFailure value) authFailure,
    required TResult Function(_UserFailure value) userFailure,
    required TResult Function(_FirebaseStorageFailure value)
        firebaseStorageFailure,
  }) {
    return createUserNameFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(NoData value)? noData,
    TResult? Function(_UnknownFailure value)? unknownFailure,
    TResult? Function(_LocalStorageFailure value)? localStorageFailure,
    TResult? Function(_CreateUserNameFailure value)? createUserNameFailure,
    TResult? Function(_AuthFailure value)? authFailure,
    TResult? Function(_UserFailure value)? userFailure,
    TResult? Function(_FirebaseStorageFailure value)? firebaseStorageFailure,
  }) {
    return createUserNameFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(NoData value)? noData,
    TResult Function(_UnknownFailure value)? unknownFailure,
    TResult Function(_LocalStorageFailure value)? localStorageFailure,
    TResult Function(_CreateUserNameFailure value)? createUserNameFailure,
    TResult Function(_AuthFailure value)? authFailure,
    TResult Function(_UserFailure value)? userFailure,
    TResult Function(_FirebaseStorageFailure value)? firebaseStorageFailure,
    required TResult orElse(),
  }) {
    if (createUserNameFailure != null) {
      return createUserNameFailure(this);
    }
    return orElse();
  }
}

abstract class _CreateUserNameFailure implements MainFailure {
  const factory _CreateUserNameFailure({required final String msg}) =
      _$CreateUserNameFailureImpl;

  @override
  String get msg;
  @override
  @JsonKey(ignore: true)
  _$$CreateUserNameFailureImplCopyWith<_$CreateUserNameFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthFailureImplCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$$AuthFailureImplCopyWith(
          _$AuthFailureImpl value, $Res Function(_$AuthFailureImpl) then) =
      __$$AuthFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$AuthFailureImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$AuthFailureImpl>
    implements _$$AuthFailureImplCopyWith<$Res> {
  __$$AuthFailureImplCopyWithImpl(
      _$AuthFailureImpl _value, $Res Function(_$AuthFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$AuthFailureImpl(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthFailureImpl implements _AuthFailure {
  const _$AuthFailureImpl({required this.msg});

  @override
  final String msg;

  @override
  String toString() {
    return 'MainFailure.authFailure(msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFailureImpl &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      __$$AuthFailureImplCopyWithImpl<_$AuthFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String msg) serverFailure,
    required TResult Function(String msg) noData,
    required TResult Function(String msg) unknownFailure,
    required TResult Function(String msg) localStorageFailure,
    required TResult Function(String msg) createUserNameFailure,
    required TResult Function(String msg) authFailure,
    required TResult Function(String msg) userFailure,
    required TResult Function(String msg) firebaseStorageFailure,
  }) {
    return authFailure(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String msg)? serverFailure,
    TResult? Function(String msg)? noData,
    TResult? Function(String msg)? unknownFailure,
    TResult? Function(String msg)? localStorageFailure,
    TResult? Function(String msg)? createUserNameFailure,
    TResult? Function(String msg)? authFailure,
    TResult? Function(String msg)? userFailure,
    TResult? Function(String msg)? firebaseStorageFailure,
  }) {
    return authFailure?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String msg)? serverFailure,
    TResult Function(String msg)? noData,
    TResult Function(String msg)? unknownFailure,
    TResult Function(String msg)? localStorageFailure,
    TResult Function(String msg)? createUserNameFailure,
    TResult Function(String msg)? authFailure,
    TResult Function(String msg)? userFailure,
    TResult Function(String msg)? firebaseStorageFailure,
    required TResult orElse(),
  }) {
    if (authFailure != null) {
      return authFailure(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(NoData value) noData,
    required TResult Function(_UnknownFailure value) unknownFailure,
    required TResult Function(_LocalStorageFailure value) localStorageFailure,
    required TResult Function(_CreateUserNameFailure value)
        createUserNameFailure,
    required TResult Function(_AuthFailure value) authFailure,
    required TResult Function(_UserFailure value) userFailure,
    required TResult Function(_FirebaseStorageFailure value)
        firebaseStorageFailure,
  }) {
    return authFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(NoData value)? noData,
    TResult? Function(_UnknownFailure value)? unknownFailure,
    TResult? Function(_LocalStorageFailure value)? localStorageFailure,
    TResult? Function(_CreateUserNameFailure value)? createUserNameFailure,
    TResult? Function(_AuthFailure value)? authFailure,
    TResult? Function(_UserFailure value)? userFailure,
    TResult? Function(_FirebaseStorageFailure value)? firebaseStorageFailure,
  }) {
    return authFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(NoData value)? noData,
    TResult Function(_UnknownFailure value)? unknownFailure,
    TResult Function(_LocalStorageFailure value)? localStorageFailure,
    TResult Function(_CreateUserNameFailure value)? createUserNameFailure,
    TResult Function(_AuthFailure value)? authFailure,
    TResult Function(_UserFailure value)? userFailure,
    TResult Function(_FirebaseStorageFailure value)? firebaseStorageFailure,
    required TResult orElse(),
  }) {
    if (authFailure != null) {
      return authFailure(this);
    }
    return orElse();
  }
}

abstract class _AuthFailure implements MainFailure {
  const factory _AuthFailure({required final String msg}) = _$AuthFailureImpl;

  @override
  String get msg;
  @override
  @JsonKey(ignore: true)
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserFailureImplCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$$UserFailureImplCopyWith(
          _$UserFailureImpl value, $Res Function(_$UserFailureImpl) then) =
      __$$UserFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$UserFailureImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$UserFailureImpl>
    implements _$$UserFailureImplCopyWith<$Res> {
  __$$UserFailureImplCopyWithImpl(
      _$UserFailureImpl _value, $Res Function(_$UserFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$UserFailureImpl(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserFailureImpl implements _UserFailure {
  const _$UserFailureImpl({required this.msg});

  @override
  final String msg;

  @override
  String toString() {
    return 'MainFailure.userFailure(msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFailureImpl &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFailureImplCopyWith<_$UserFailureImpl> get copyWith =>
      __$$UserFailureImplCopyWithImpl<_$UserFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String msg) serverFailure,
    required TResult Function(String msg) noData,
    required TResult Function(String msg) unknownFailure,
    required TResult Function(String msg) localStorageFailure,
    required TResult Function(String msg) createUserNameFailure,
    required TResult Function(String msg) authFailure,
    required TResult Function(String msg) userFailure,
    required TResult Function(String msg) firebaseStorageFailure,
  }) {
    return userFailure(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String msg)? serverFailure,
    TResult? Function(String msg)? noData,
    TResult? Function(String msg)? unknownFailure,
    TResult? Function(String msg)? localStorageFailure,
    TResult? Function(String msg)? createUserNameFailure,
    TResult? Function(String msg)? authFailure,
    TResult? Function(String msg)? userFailure,
    TResult? Function(String msg)? firebaseStorageFailure,
  }) {
    return userFailure?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String msg)? serverFailure,
    TResult Function(String msg)? noData,
    TResult Function(String msg)? unknownFailure,
    TResult Function(String msg)? localStorageFailure,
    TResult Function(String msg)? createUserNameFailure,
    TResult Function(String msg)? authFailure,
    TResult Function(String msg)? userFailure,
    TResult Function(String msg)? firebaseStorageFailure,
    required TResult orElse(),
  }) {
    if (userFailure != null) {
      return userFailure(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(NoData value) noData,
    required TResult Function(_UnknownFailure value) unknownFailure,
    required TResult Function(_LocalStorageFailure value) localStorageFailure,
    required TResult Function(_CreateUserNameFailure value)
        createUserNameFailure,
    required TResult Function(_AuthFailure value) authFailure,
    required TResult Function(_UserFailure value) userFailure,
    required TResult Function(_FirebaseStorageFailure value)
        firebaseStorageFailure,
  }) {
    return userFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(NoData value)? noData,
    TResult? Function(_UnknownFailure value)? unknownFailure,
    TResult? Function(_LocalStorageFailure value)? localStorageFailure,
    TResult? Function(_CreateUserNameFailure value)? createUserNameFailure,
    TResult? Function(_AuthFailure value)? authFailure,
    TResult? Function(_UserFailure value)? userFailure,
    TResult? Function(_FirebaseStorageFailure value)? firebaseStorageFailure,
  }) {
    return userFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(NoData value)? noData,
    TResult Function(_UnknownFailure value)? unknownFailure,
    TResult Function(_LocalStorageFailure value)? localStorageFailure,
    TResult Function(_CreateUserNameFailure value)? createUserNameFailure,
    TResult Function(_AuthFailure value)? authFailure,
    TResult Function(_UserFailure value)? userFailure,
    TResult Function(_FirebaseStorageFailure value)? firebaseStorageFailure,
    required TResult orElse(),
  }) {
    if (userFailure != null) {
      return userFailure(this);
    }
    return orElse();
  }
}

abstract class _UserFailure implements MainFailure {
  const factory _UserFailure({required final String msg}) = _$UserFailureImpl;

  @override
  String get msg;
  @override
  @JsonKey(ignore: true)
  _$$UserFailureImplCopyWith<_$UserFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirebaseStorageFailureImplCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$$FirebaseStorageFailureImplCopyWith(
          _$FirebaseStorageFailureImpl value,
          $Res Function(_$FirebaseStorageFailureImpl) then) =
      __$$FirebaseStorageFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$FirebaseStorageFailureImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$FirebaseStorageFailureImpl>
    implements _$$FirebaseStorageFailureImplCopyWith<$Res> {
  __$$FirebaseStorageFailureImplCopyWithImpl(
      _$FirebaseStorageFailureImpl _value,
      $Res Function(_$FirebaseStorageFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$FirebaseStorageFailureImpl(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FirebaseStorageFailureImpl implements _FirebaseStorageFailure {
  const _$FirebaseStorageFailureImpl({required this.msg});

  @override
  final String msg;

  @override
  String toString() {
    return 'MainFailure.firebaseStorageFailure(msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseStorageFailureImpl &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseStorageFailureImplCopyWith<_$FirebaseStorageFailureImpl>
      get copyWith => __$$FirebaseStorageFailureImplCopyWithImpl<
          _$FirebaseStorageFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String msg) serverFailure,
    required TResult Function(String msg) noData,
    required TResult Function(String msg) unknownFailure,
    required TResult Function(String msg) localStorageFailure,
    required TResult Function(String msg) createUserNameFailure,
    required TResult Function(String msg) authFailure,
    required TResult Function(String msg) userFailure,
    required TResult Function(String msg) firebaseStorageFailure,
  }) {
    return firebaseStorageFailure(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String msg)? serverFailure,
    TResult? Function(String msg)? noData,
    TResult? Function(String msg)? unknownFailure,
    TResult? Function(String msg)? localStorageFailure,
    TResult? Function(String msg)? createUserNameFailure,
    TResult? Function(String msg)? authFailure,
    TResult? Function(String msg)? userFailure,
    TResult? Function(String msg)? firebaseStorageFailure,
  }) {
    return firebaseStorageFailure?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String msg)? serverFailure,
    TResult Function(String msg)? noData,
    TResult Function(String msg)? unknownFailure,
    TResult Function(String msg)? localStorageFailure,
    TResult Function(String msg)? createUserNameFailure,
    TResult Function(String msg)? authFailure,
    TResult Function(String msg)? userFailure,
    TResult Function(String msg)? firebaseStorageFailure,
    required TResult orElse(),
  }) {
    if (firebaseStorageFailure != null) {
      return firebaseStorageFailure(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(NoData value) noData,
    required TResult Function(_UnknownFailure value) unknownFailure,
    required TResult Function(_LocalStorageFailure value) localStorageFailure,
    required TResult Function(_CreateUserNameFailure value)
        createUserNameFailure,
    required TResult Function(_AuthFailure value) authFailure,
    required TResult Function(_UserFailure value) userFailure,
    required TResult Function(_FirebaseStorageFailure value)
        firebaseStorageFailure,
  }) {
    return firebaseStorageFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(NoData value)? noData,
    TResult? Function(_UnknownFailure value)? unknownFailure,
    TResult? Function(_LocalStorageFailure value)? localStorageFailure,
    TResult? Function(_CreateUserNameFailure value)? createUserNameFailure,
    TResult? Function(_AuthFailure value)? authFailure,
    TResult? Function(_UserFailure value)? userFailure,
    TResult? Function(_FirebaseStorageFailure value)? firebaseStorageFailure,
  }) {
    return firebaseStorageFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(NoData value)? noData,
    TResult Function(_UnknownFailure value)? unknownFailure,
    TResult Function(_LocalStorageFailure value)? localStorageFailure,
    TResult Function(_CreateUserNameFailure value)? createUserNameFailure,
    TResult Function(_AuthFailure value)? authFailure,
    TResult Function(_UserFailure value)? userFailure,
    TResult Function(_FirebaseStorageFailure value)? firebaseStorageFailure,
    required TResult orElse(),
  }) {
    if (firebaseStorageFailure != null) {
      return firebaseStorageFailure(this);
    }
    return orElse();
  }
}

abstract class _FirebaseStorageFailure implements MainFailure {
  const factory _FirebaseStorageFailure({required final String msg}) =
      _$FirebaseStorageFailureImpl;

  @override
  String get msg;
  @override
  @JsonKey(ignore: true)
  _$$FirebaseStorageFailureImplCopyWith<_$FirebaseStorageFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
