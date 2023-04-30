import '../../../../shared/data/network/network_info.dart';
import '../../../../shared/domain/exception/app_exception.dart';
import '../../../../shared/domain/models/no_params.dart';
import '../../domain/entities/app_user.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../data_source/authentication_data_source.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final NetworkInfo networkInfo;
  final AuthenticationDataSource dataSource;

  AuthenticationRepositoryImpl({required this.networkInfo, required this.dataSource});

  @override
  Future<AppUser?> signInWithGoogle(NoParams params) async {
    // Check if the network is available
    if (!await networkInfo.isConnected) {
      // Throw the exception of no internet connection
      return throw const AppException.noInternet();
    }
    try {
      // If the operation successful
      return await dataSource.signInWithGoogle();
    } on AppException catch (_) {
      // Return the [AppException]
      rethrow;
    } catch (e) {
      // Return if something else happened
      throw const AppException.unknown();
    }
  }

  @override
  Future<bool> signOut(NoParams params) async {
    // Check if the network is available
    if (!await networkInfo.isConnected) {
      // Throw the exception of no internet connection
      return throw const AppException.noInternet();
    }
    try {
      // If the operation successful
      return await dataSource.signOut();
    } on AppException catch (_) {
      // Return the [AppException]
      rethrow;
    } catch (e) {
      // Return if something else happened
      throw const AppException.unknown();
    }
  }
}
