import 'package:health/health.dart';

import '../../../../shared/domain/exception/app_exception.dart';
import '../../application/permission_service.dart';
import '../../domain/entities/date_interval.dart';
import '../../domain/repositories/home_repository.dart';
import '../data_sources/home_data_source.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource dataSource;
  final PermissionService permissionService;

  HomeRepositoryImpl(
      {required this.dataSource, required this.permissionService});

  @override
  Future<List<HealthDataPoint>> fetchDailyData(
      DateInterval dateInterval) async {
    // TODO: check the internet connection
    // Check if the network is available
    // if (!await networkInfo.isConnected) {
    //   // Throw the exception of no internet connection
    //   return throw const AppException.noInternet();
    // }

    // check if app has the permission to access data
    if (!await permissionService.checkPermission()) {
      // Throw the exception of no permission is granted
      throw const AppException.healthNotAuthorized();
    }

    try {
      // If the operation successful
      return await dataSource.fetchDailyData(
          dateInterval.from, dateInterval.to);
    } on AppException catch (_) {
      // Return the [AppException]
      rethrow;
    } catch (e) {
      // Return if something else happened
      throw const AppException.unknown();
    }
  }

  @override
  Future<int> fetchStepsInInterval(DateInterval dateInterval) async {
    // TODO: check the internet connection
    // Check if the network is available
    // if (!await networkInfo.isConnected) {
    //   // Throw the exception of no internet connection
    //   return throw const AppException.noInternet();
    // }

    // check if app has the permission to access data
    if (!await permissionService.checkPermission()) {
      // Throw the exception of no permission is granted
      throw const AppException.healthNotAuthorized();
    }

    try {
      // If the operation successful
      return await dataSource.fetchStepsInInterval(
        dateInterval.from,
        dateInterval.to,
      );
    } on AppException catch (_) {
      // Return the [AppException]
      rethrow;
    } catch (e) {
      // Return if something else happened
      throw const AppException.unknown();
    }
  }
}
