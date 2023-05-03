import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/domain/providers/external_providers.dart';
import '../data/data_sources/home_data_source.dart';
import '../data/repositories/home_repository_impl.dart';
import '../domain/repositories/home_repository.dart';
import '../domain/usecases/daily_data_usecase.dart';
import '../domain/usecases/interval_steps_usecase.dart';
import 'permission_service.dart';

part 'home_providers.g.dart';

///
/// Provider for the [HomeDataSource] instance with AutoDispose
@riverpod
HomeDataSource homeDataSource(HomeDataSourceRef ref) {
  final health = ref.watch(healthFactoryProvider);
  return HomeDataSourceImpl(health);
}

///
/// Provider for the [HomeRepository] instance with AutoDispose
@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  final dataSource = ref.watch(homeDataSourceProvider);
  final permissionService = ref.watch(permissionServiceProvider.notifier);
  return HomeRepositoryImpl(
    dataSource: dataSource,
    permissionService: permissionService,
  );
}

///
/// Provider for the [DailyDataUsecase] instance with AutoDispose
@riverpod
DailyDataUsecase dailyDataUsecase(DailyDataUsecaseRef ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return DailyDataUsecase(repository);
}

///
/// Provider for the [IntervalStepsUsecase] instance with AutoDispose
@riverpod
IntervalStepsUsecase intervalStepsUsecase(IntervalStepsUsecaseRef ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return IntervalStepsUsecase(repository);
}
