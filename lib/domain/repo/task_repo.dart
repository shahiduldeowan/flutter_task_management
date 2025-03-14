import "package:task/core/utils/type_defs.dart";
import "package:task/domain/entity/task.dart";

abstract class TaskRepo {
  ResultFuture<List<TaskEntity>> getTasks();
  ResultFuture<String> addTask(TaskEntity task);
  ResultFuture<String> deleteTask(String id);
  ResultFuture<String> updateTask(TaskEntity task);
}
