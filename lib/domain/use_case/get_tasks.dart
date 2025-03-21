import "package:injectable/injectable.dart";
import "package:task/core/di/locator.dart";
import "package:task/core/utils/type_defs.dart";
import "package:task/core/utils/use_case.dart";
import "package:task/domain/entity/task.dart";
import "package:task/domain/repo/task_repo.dart";

@lazySingleton
class GetTasksUseCase implements UseCase<List<TaskEntity>, dynamic> {
  GetTasksUseCase();

  @override
  ResultFuture<List<TaskEntity>> call({param}) {
    return sl<TaskRepo>().getTasks();
  }
}
