abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

abstract class InstantUseCase<Type, Params> {
  Type call(Params params);
}
