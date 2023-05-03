import '../../../../shared/domain/exception/app_exception.dart';
import '../../../../shared/domain/usecase/usecase.dart';
import '../entities/date_interval.dart';
import '../repositories/home_repository.dart';

/// Usecase to get step count over the given interval
/// [Input]: [DateInterval] are given
/// [Output]: [int] return integer count if the operation successful
/// returns [AppException] if failure
class IntervalStepsUsecase implements UseCase<int, DateInterval> {
  HomeRepository repository;

  IntervalStepsUsecase(this.repository);

  @override
  Future<int> call(DateInterval params) async {
    return await repository.fetchStepsInInterval(params);
  }
}
