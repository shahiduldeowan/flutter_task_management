import "package:injectable/injectable.dart";
import "package:task/core/utils/type_defs.dart";
import "package:task/core/utils/use_case.dart";
import "package:task/domain/entity/task.dart";
import "package:task/domain/repo/task_repo.dart";

@lazySingleton
class AddTaskUseCase implements UseCaseVoid<TaskEntity> {
  AddTaskUseCase(this._repository);

  final TaskRepo _repository;

  @override
  ResultVoid call(TaskEntity task) {
    return _repository.addTask(task);
  }
}
