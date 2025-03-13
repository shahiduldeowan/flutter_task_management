import "package:injectable/injectable.dart";
import "package:task/core/utils/type_defs.dart";
import "package:task/core/utils/use_case.dart";
import "package:task/domain/entity/task.dart";
import "package:task/domain/repo/task_repo.dart";

@lazySingleton
class UpdateTaskUseCase implements UseCaseVoid<TaskEntity> {
  final TaskRepo _repository;

  UpdateTaskUseCase(this._repository);

  @override
  ResultVoid call(TaskEntity task) {
    return _repository.updateTask(task);
  }
}
