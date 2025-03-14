import "package:injectable/injectable.dart";
import "package:task/core/di/locator.dart";
import "package:task/core/utils/type_defs.dart";
import "package:task/core/utils/use_case.dart";
import "package:task/domain/repo/task_repo.dart";

@lazySingleton
class DeleteTaskUseCase implements UseCase<String, String> {
  DeleteTaskUseCase();

  @override
  ResultFuture<String> call({String? param}) {
    return sl<TaskRepo>().deleteTask(param!);
  }
}
