import '../../../../shared/domain/exception/app_exception.dart';
import '../../../../shared/domain/models/no_params.dart';
import '../entities/app_user.dart';

abstract class AuthenticationRepository {
  /// This method login the user and return the user credentials
  /// [Input] : [NoParams]
  /// [Output] : if operation successful returns [AppUser] returns the user info
  /// if unsuccessful the response will be [AppException]
  Future<AppUser?> signInWithGoogle(NoParams params);

  /// This method logs out the user and remove the cache info of user
  /// [Input] : [NoParams] gets noParams for the input
  /// [Output] : if operation successful returns [bool] returns true
  /// if unsuccessful the response will be [AppException]
  Future<bool> signOut(NoParams params);
}
