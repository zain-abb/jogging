import 'package:health/health.dart';

import '../entities/date_interval.dart';

abstract class HomeRepository {
  /// This method fetch the daily data and returns the list of data points
  /// [Input] : [DateInterval]
  /// [Output] : if operation successful returns a list of [HealthDataPoint]
  /// if unsuccessful the response will be [AppException]
  Future<List<HealthDataPoint>> fetchDailyData(DateInterval dateInterval);

  /// This method fetch the steps in the given interval and give an integer count
  /// [Input] : [DateInterval]
  /// [Output] : if operation successful returns an integer [count]
  /// if unsuccessful the response will be [AppException]
  Future<int> fetchStepsInInterval(DateInterval dateInterval);
}
