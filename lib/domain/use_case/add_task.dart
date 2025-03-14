import "package:injectable/injectable.dart";
import "package:task/core/di/locator.dart";
import "package:task/core/utils/type_defs.dart";
import "package:task/core/utils/use_case.dart";
import "package:task/domain/entity/task.dart";
import "package:task/domain/repo/task_repo.dart";

@lazySingleton
class AddTaskUseCase implements UseCase<String, TaskEntity> {
  AddTaskUseCase();

  @override
  ResultFuture<String> call({TaskEntity? param}) {
    return sl<TaskRepo>().addTask(param!);
  }
}
