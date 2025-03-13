import "package:injectable/injectable.dart";
import "package:task/core/utils/type_defs.dart";
import "package:task/core/utils/use_case.dart";
import "package:task/domain/repo/task_repo.dart";

@lazySingleton
class DeleteTaskUseCase implements UseCaseVoid<String> {
  final TaskRepo _repository;

  DeleteTaskUseCase(this._repository);

  @override
  ResultVoid call(String taskId) {
    return _repository.deleteTask(taskId);
  }
}
