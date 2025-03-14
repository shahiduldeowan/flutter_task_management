import "package:dartz/dartz.dart";
import "package:injectable/injectable.dart";
import "package:task/core/errors/failures.dart";
import "package:task/core/utils/type_defs.dart";
import "package:task/data/data_source/task_local.dart";
import "package:task/domain/entity/task.dart";
import "package:task/domain/repo/task_repo.dart";

@LazySingleton(as: TaskRepo)
class TaskRepoImpl implements TaskRepo {
  const TaskRepoImpl(this._taskLocalDataSource);

  final TaskLocalDataSource _taskLocalDataSource;

  @override
  ResultFuture<List<TaskEntity>> getTasks() async {
    return _handleErrors(() async => await _taskLocalDataSource.getTasks());
  }

  @override
  ResultFuture<String> addTask(TaskEntity task) async {
    return _handleErrors(() async => await _taskLocalDataSource.addTask(task));
  }

  @override
  ResultFuture<String> updateTask(TaskEntity task) async {
    return _handleErrors(
        () async => await _taskLocalDataSource.updateTask(task));
  }

  @override
  ResultFuture<String> deleteTask(String id) async {
    return _handleErrors(() async => await _taskLocalDataSource.deleteTask(id));
  }

  /// Centralized error handling for local data source operations.
  Future<Either<Failure, T>> _handleErrors<T>(
    Future<T> Function() operation,
  ) async {
    try {
      final result = await operation();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(error: e.toString()));
    }
  }
}
