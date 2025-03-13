import "package:task/core/utils/type_defs.dart";

/// Generic UseCase for operations requiring parameters.
abstract class UseCase<T, P> {
  ResultFuture<T> call(P param);
}

/// Specialized UseCase for operations requiring no parameters.
abstract class NoParamUseCase<T> {
  ResultFuture<T> call();
}

/// Specialized UseCase for operations that return void.
abstract class UseCaseVoid<P> {
  ResultVoid call(P param);
}
