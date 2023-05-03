import 'package:health/health.dart';
import 'package:jogging/features/home/application/home_providers.dart';
import 'package:jogging/features/home/domain/entities/date_interval.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeController extends _$HomeController {
  List<HealthDataPoint> _dailyDataPoints = <HealthDataPoint>[];
  int _stepsInInterval = 0;

  @override
  FutureOr<void> build() async {
    return;
  }

  List<HealthDataPoint> get dailyDataPoints => _dailyDataPoints;
  int get stepsInInterval => _stepsInInterval;

  Future<List<HealthDataPoint>> fetchDailyData(DateInterval params) async {
    state = const AsyncValue.loading();
    try {
      _dailyDataPoints = await _getDailyData(params);
      _dailyDataPoints = HealthFactory.removeDuplicates(_dailyDataPoints);
      state = const AsyncValue.data(null);
      return _dailyDataPoints;
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
    return [];
  }

  Future<List<HealthDataPoint>> _getDailyData(DateInterval params) async {
    final usecase = ref.read(dailyDataUsecaseProvider);
    return usecase.call(params);
  }

  Future<int> fetchStepsInInterval(DateInterval params) async {
    state = const AsyncValue.loading();
    try {
      _stepsInInterval = await _getStepsInInterval(params);
      state = const AsyncValue.data(null);
      return _stepsInInterval;
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
    return 0;
  }

  Future<int> _getStepsInInterval(DateInterval params) async {
    final usecase = ref.read(intervalStepsUsecaseProvider);
    return usecase.call(params);
  }
}
