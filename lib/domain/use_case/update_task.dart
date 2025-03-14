import "package:injectable/injectable.dart";
import "package:task/core/di/locator.dart";
import "package:task/core/utils/type_defs.dart";
import "package:task/core/utils/use_case.dart";
import "package:task/domain/entity/task.dart";
import "package:task/domain/repo/task_repo.dart";

@lazySingleton
class UpdateTaskUseCase implements UseCase<String, TaskEntity> {
  const UpdateTaskUseCase();

  @override
  ResultFuture<String> call({TaskEntity? param}) {
    return sl<TaskRepo>().updateTask(param!);
  }
}
