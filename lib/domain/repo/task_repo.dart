import "package:task/core/utils/type_defs.dart";
import "package:task/domain/entity/task.dart";

abstract class TaskRepo {
  ResultFuture<List<TaskEntity>> getTasks();
  ResultVoid addTask(TaskEntity task);
  ResultVoid deleteTask(String id);
  ResultVoid updateTask(TaskEntity task);
}
