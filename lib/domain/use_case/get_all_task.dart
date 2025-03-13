import "package:injectable/injectable.dart";
import "package:task/core/utils/type_defs.dart";
import "package:task/core/utils/use_case.dart";
import "package:task/domain/entity/task.dart";
import "package:task/domain/repo/task_repo.dart";

@lazySingleton
class GetAllTaskUseCase implements NoParamUseCase<List<TaskEntity>> {
  GetAllTaskUseCase(this._repository);

  final TaskRepo _repository;

  @override
  ResultFuture<List<TaskEntity>> call() {
    return _repository.getTasks();
  }
}
