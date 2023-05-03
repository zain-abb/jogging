import '../../../../shared/domain/exception/app_exception.dart';
import '../../../../shared/domain/models/no_params.dart';
import '../../../../shared/domain/usecase/usecase.dart';
import '../repositories/authentication_repository.dart';

/// Usecase to logout the user
/// [Input]: [NoParams] are given
/// [Output]: [bool] return true if the operation successful
/// returns [AppException] if failure
class SignOutUsecase implements UseCase<bool, NoParams> {
  AuthenticationRepository repository;

  SignOutUsecase(this.repository);

  @override
  Future<bool> call(NoParams params) async {
    return await repository.signOut(params);
  }
}
