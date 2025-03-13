import "package:dartz/dartz.dart";
import "package:task/core/errors/failures.dart";

/// Generic result type for Future-based operations.
typedef ResultFuture<T> = Future<Either<Failure, T>>;

/// Specialized result type for operations that return void.
typedef ResultVoid = ResultFuture<void>;
