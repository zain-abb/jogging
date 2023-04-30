import '../../../../shared/domain/exception/app_exception.dart';
import '../../../../shared/domain/models/no_params.dart';
import '../../../../shared/domain/usecase/usecase.dart';
import '../entities/app_user.dart';
import '../repositories/authentication_repository.dart';

/// Usecase to login the user
/// [Input]: [NoParams] are given
/// [Output]: [AppUser] return user credentials if the operation successful
/// returns [AppException] if failure
class SignInUsecase implements UseCase<AppUser?, NoParams> {
  AuthenticationRepository repository;

  SignInUsecase(this.repository);

  @override
  Future<AppUser?> call(NoParams params) async {
    return await repository.signInWithGoogle(params);
  }
}
