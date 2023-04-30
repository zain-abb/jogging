// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountExists,
    required TResult Function() invalidCredentials,
    required TResult Function() unknown,
    required TResult Function() noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountExists,
    TResult? Function()? invalidCredentials,
    TResult? Function()? unknown,
    TResult? Function()? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountExists,
    TResult Function()? invalidCredentials,
    TResult Function()? unknown,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountExists value) accountExists,
    required TResult Function(InvalidCredentials value) invalidCredentials,
    required TResult Function(Unknown value) unknown,
    required TResult Function(NoInternet value) noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountExists value)? accountExists,
    TResult? Function(InvalidCredentials value)? invalidCredentials,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(NoInternet value)? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountExists value)? accountExists,
    TResult Function(InvalidCredentials value)? invalidCredentials,
    TResult Function(Unknown value)? unknown,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res, AppException>;
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res, $Val extends AppException>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AccountExistsCopyWith<$Res> {
  factory _$$AccountExistsCopyWith(
          _$AccountExists value, $Res Function(_$AccountExists) then) =
      __$$AccountExistsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountExistsCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$AccountExists>
    implements _$$AccountExistsCopyWith<$Res> {
  __$$AccountExistsCopyWithImpl(
      _$AccountExists _value, $Res Function(_$AccountExists) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AccountExists implements AccountExists {
  const _$AccountExists();

  @override
  String toString() {
    return 'AppException.accountExists()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AccountExists);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountExists,
    required TResult Function() invalidCredentials,
    required TResult Function() unknown,
    required TResult Function() noInternet,
  }) {
    return accountExists();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountExists,
    TResult? Function()? invalidCredentials,
    TResult? Function()? unknown,
    TResult? Function()? noInternet,
  }) {
    return accountExists?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountExists,
    TResult Function()? invalidCredentials,
    TResult Function()? unknown,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (accountExists != null) {
      return accountExists();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountExists value) accountExists,
    required TResult Function(InvalidCredentials value) invalidCredentials,
    required TResult Function(Unknown value) unknown,
    required TResult Function(NoInternet value) noInternet,
  }) {
    return accountExists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountExists value)? accountExists,
    TResult? Function(InvalidCredentials value)? invalidCredentials,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(NoInternet value)? noInternet,
  }) {
    return accountExists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountExists value)? accountExists,
    TResult Function(InvalidCredentials value)? invalidCredentials,
    TResult Function(Unknown value)? unknown,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (accountExists != null) {
      return accountExists(this);
    }
    return orElse();
  }
}

abstract class AccountExists implements AppException {
  const factory AccountExists() = _$AccountExists;
}

/// @nodoc
abstract class _$$InvalidCredentialsCopyWith<$Res> {
  factory _$$InvalidCredentialsCopyWith(_$InvalidCredentials value,
          $Res Function(_$InvalidCredentials) then) =
      __$$InvalidCredentialsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidCredentialsCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$InvalidCredentials>
    implements _$$InvalidCredentialsCopyWith<$Res> {
  __$$InvalidCredentialsCopyWithImpl(
      _$InvalidCredentials _value, $Res Function(_$InvalidCredentials) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvalidCredentials implements InvalidCredentials {
  const _$InvalidCredentials();

  @override
  String toString() {
    return 'AppException.invalidCredentials()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidCredentials);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountExists,
    required TResult Function() invalidCredentials,
    required TResult Function() unknown,
    required TResult Function() noInternet,
  }) {
    return invalidCredentials();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountExists,
    TResult? Function()? invalidCredentials,
    TResult? Function()? unknown,
    TResult? Function()? noInternet,
  }) {
    return invalidCredentials?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountExists,
    TResult Function()? invalidCredentials,
    TResult Function()? unknown,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (invalidCredentials != null) {
      return invalidCredentials();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountExists value) accountExists,
    required TResult Function(InvalidCredentials value) invalidCredentials,
    required TResult Function(Unknown value) unknown,
    required TResult Function(NoInternet value) noInternet,
  }) {
    return invalidCredentials(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountExists value)? accountExists,
    TResult? Function(InvalidCredentials value)? invalidCredentials,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(NoInternet value)? noInternet,
  }) {
    return invalidCredentials?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountExists value)? accountExists,
    TResult Function(InvalidCredentials value)? invalidCredentials,
    TResult Function(Unknown value)? unknown,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (invalidCredentials != null) {
      return invalidCredentials(this);
    }
    return orElse();
  }
}

abstract class InvalidCredentials implements AppException {
  const factory InvalidCredentials() = _$InvalidCredentials;
}

/// @nodoc
abstract class _$$UnknownCopyWith<$Res> {
  factory _$$UnknownCopyWith(_$Unknown value, $Res Function(_$Unknown) then) =
      __$$UnknownCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$Unknown>
    implements _$$UnknownCopyWith<$Res> {
  __$$UnknownCopyWithImpl(_$Unknown _value, $Res Function(_$Unknown) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Unknown implements Unknown {
  const _$Unknown();

  @override
  String toString() {
    return 'AppException.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Unknown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountExists,
    required TResult Function() invalidCredentials,
    required TResult Function() unknown,
    required TResult Function() noInternet,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountExists,
    TResult? Function()? invalidCredentials,
    TResult? Function()? unknown,
    TResult? Function()? noInternet,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountExists,
    TResult Function()? invalidCredentials,
    TResult Function()? unknown,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountExists value) accountExists,
    required TResult Function(InvalidCredentials value) invalidCredentials,
    required TResult Function(Unknown value) unknown,
    required TResult Function(NoInternet value) noInternet,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountExists value)? accountExists,
    TResult? Function(InvalidCredentials value)? invalidCredentials,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(NoInternet value)? noInternet,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountExists value)? accountExists,
    TResult Function(InvalidCredentials value)? invalidCredentials,
    TResult Function(Unknown value)? unknown,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class Unknown implements AppException {
  const factory Unknown() = _$Unknown;
}

/// @nodoc
abstract class _$$NoInternetCopyWith<$Res> {
  factory _$$NoInternetCopyWith(
          _$NoInternet value, $Res Function(_$NoInternet) then) =
      __$$NoInternetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoInternetCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$NoInternet>
    implements _$$NoInternetCopyWith<$Res> {
  __$$NoInternetCopyWithImpl(
      _$NoInternet _value, $Res Function(_$NoInternet) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoInternet implements NoInternet {
  const _$NoInternet();

  @override
  String toString() {
    return 'AppException.noInternet()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoInternet);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountExists,
    required TResult Function() invalidCredentials,
    required TResult Function() unknown,
    required TResult Function() noInternet,
  }) {
    return noInternet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountExists,
    TResult? Function()? invalidCredentials,
    TResult? Function()? unknown,
    TResult? Function()? noInternet,
  }) {
    return noInternet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountExists,
    TResult Function()? invalidCredentials,
    TResult Function()? unknown,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountExists value) accountExists,
    required TResult Function(InvalidCredentials value) invalidCredentials,
    required TResult Function(Unknown value) unknown,
    required TResult Function(NoInternet value) noInternet,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountExists value)? accountExists,
    TResult? Function(InvalidCredentials value)? invalidCredentials,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(NoInternet value)? noInternet,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountExists value)? accountExists,
    TResult Function(InvalidCredentials value)? invalidCredentials,
    TResult Function(Unknown value)? unknown,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class NoInternet implements AppException {
  const factory NoInternet() = _$NoInternet;
}
