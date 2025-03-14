import "package:task/core/utils/type_defs.dart";

/// Generic UseCase for operations requiring parameters.
abstract class UseCase<T, P> {
  ResultFuture<T> call({P param});
}
