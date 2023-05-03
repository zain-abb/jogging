import 'package:health/health.dart';

import '../../../../shared/domain/exception/app_exception.dart';

abstract class HomeDataSource {
  /// Fetch the daily steps data [from] date [to] date
  ///
  /// Returned Future resolves to a list of [HealthDataPoint] for a
  /// successful data fetch or [AppException] in case process was failed.
  Future<List<HealthDataPoint>> fetchDailyData(DateTime from, DateTime to);

  /// Fetch the step counts [from] date [to] date
  ///
  /// Returned Future resolves to an integer of [count] for a
  /// successful data fetch or [AppException] in case process was failed.
  Future<int> fetchStepsInInterval(DateTime from, DateTime to);
}

class HomeDataSourceImpl extends HomeDataSource {
  final HealthFactory health;

  HomeDataSourceImpl(this.health);

  @override
  Future<List<HealthDataPoint>> fetchDailyData(
    DateTime from,
    DateTime to,
  ) async {
    final types = [HealthDataType.STEPS];
    try {
      // fetch health data
      List<HealthDataPoint> healthData =
          await health.getHealthDataFromTypes(from, to, types);

      return healthData;
    } catch (e) {
      throw const AppException.healthFetchFailed();
    }
  }

  @override
  Future<int> fetchStepsInInterval(DateTime from, DateTime to) async {
    try {
      // fetch the step counts
      // Returns null if not successful.
      final steps = await health.getTotalStepsInInterval(from, to);
      if (steps != null) {
        return steps;
      } else {
        throw const AppException.healthStepsFailed();
      }
    } catch (error) {
      print(error);
      throw const AppException.healthStepsFailed();
    }
  }
}
