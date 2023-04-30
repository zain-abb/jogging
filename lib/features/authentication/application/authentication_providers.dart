import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/domain/providers/external_providers.dart';
import '../data/data_source/authentication_data_source.dart';
import '../data/repositories/authentication_repository_impl.dart';
import '../domain/repositories/authentication_repository.dart';
import '../domain/usecases/sign_in_usecase.dart';

part 'authentication_providers.g.dart';

///
/// Provider for the [AuthenticationDataSource] instance with AutoDispose
@riverpod
AuthenticationDataSource authenticationDataSource(AuthenticationDataSourceRef ref) {
  final auth = ref.watch(firebaseAuthProvider);
  return AuthenticationDataSourceImpl(auth);
}

///
/// Provider for the [AuthenticationRepository] instance with AutoDispose
@riverpod
AuthenticationRepository authenticationRepository(AuthenticationRepositoryRef ref) {
  final networkInfo = ref.watch(networkInfoProvider);
  final dataSource = ref.watch(authenticationDataSourceProvider);
  return AuthenticationRepositoryImpl(networkInfo: networkInfo, dataSource: dataSource);
}

///
/// Provider for the [SignInUsecase] instance with AutoDispose
@riverpod
SignInUsecase signInUsecase(SignInUsecaseRef ref) {
  final repository = ref.watch(authenticationRepositoryProvider);
  return SignInUsecase(repository);
}
