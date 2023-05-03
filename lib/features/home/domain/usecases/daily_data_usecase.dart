import 'package:health/health.dart';

import '../../../../shared/domain/exception/app_exception.dart';
import '../../../../shared/domain/usecase/usecase.dart';
import '../entities/date_interval.dart';
import '../repositories/home_repository.dart';

/// Usecase to get daily steps data
/// [Input]: [DateInterval] are given
/// [Output]: [HealthDataPoint] return list of data points if the operation successful
/// returns [AppException] if failure
class DailyDataUsecase implements UseCase<List<HealthDataPoint>, DateInterval> {
  HomeRepository repository;

  DailyDataUsecase(this.repository);

  @override
  Future<List<HealthDataPoint>> call(DateInterval params) async {
    return await repository.fetchDailyData(params);
  }
}
