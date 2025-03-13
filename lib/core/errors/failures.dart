import "package:equatable/equatable.dart";
import "package:hive/hive.dart";

sealed class Failure extends Equatable {
  const Failure({required this.error, required this.statusCode});

  final Object? error;
  final int statusCode;

  String get errorMessage => "[$statusCode] Error: $error";

  @override
  List<Object?> get props => [error, statusCode];
}

class CacheFailure extends Failure {
  const CacheFailure({required super.error}) : super(statusCode: 3);

  /// Handles Hive-related exceptions
  CacheFailure.fromHiveException(HiveError e) : this(error: e.message);

  /// Handles general exceptions related to caching
  CacheFailure.fromException(Exception e) : this(error: e.toString());
}
