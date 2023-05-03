import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app/extensions.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException {
  // Auth
  const factory AppException.accountExists() = AccountExists;
  const factory AppException.invalidCredentials() = InvalidCredentials;
  const factory AppException.unknown() = Unknown;
  const factory AppException.noInternet() = NoInternet;
  const factory AppException.healthFetchFailed() = HealthFetchFailed;
  const factory AppException.healthNotAuthorized() = HealthNotAuthorized;
  const factory AppException.healthStepsFailed() = HealthStepsFailed;
  const factory AppException.revokePermissionFailed() = RevokePermissionFailed;
}

class AppExceptionData extends Equatable {
  const AppExceptionData(this.code, this.message);
  final String code;
  final String message;

  @override
  List<Object?> get props => [code, message];

  @override
  bool? get stringify => true;
}

extension AppExceptionDetails on AppException {
  AppExceptionData get details {
    return when(
      // Auth
      accountExists: () => AppExceptionData(
        'account-exists-with-different-credential',
        'The account already exists with a different credential.'.hardcoded,
      ),
      invalidCredentials: () => AppExceptionData(
        'invalid-credential',
        'Error occurred while accessing credentials. Try again.'.hardcoded,
      ),
      unknown: () => AppExceptionData(
        'unknown',
        'Something went wrong. Try Again!'.hardcoded,
      ),
      noInternet: () => AppExceptionData(
        'no-internet',
        "It's look like you are not connected to internet. Check your Internet settings and try again."
            .hardcoded,
      ),
      healthFetchFailed: () => AppExceptionData(
        'health-data-fetch-failed',
        'Something went wrong while fetching the data. Please try again!'
            .hardcoded,
      ),
      healthNotAuthorized: () => AppExceptionData(
        'health-permission-not-granted',
        'We do not have the permission to access your health data. Please grant permission to continue!'
            .hardcoded,
      ),
      healthStepsFailed: () => AppExceptionData(
        'health-step-count-fetch-failed',
        'Something went wrong while fetching your steps count. Please try again!'
            .hardcoded,
      ),
      revokePermissionFailed: () => AppExceptionData(
        'health-permission-revoke-failed',
        'Something went wrong while revoking health permissions. Please try again!'
            .hardcoded,
      ),
    );
  }
}
