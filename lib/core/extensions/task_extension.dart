import "package:task/domain/entity/task.dart";

extension TaskExtension on List<TaskEntity> {
  ({int assignedTask, int completedTask}) getSummary() {
    int assignedTask = 0;
    int completedTask = 0;

    for (var element in this) {
      element.isCompleted ? completedTask++ : assignedTask++;
    }

    return (assignedTask: assignedTask, completedTask: completedTask);
  }

  List<TaskEntity> getCompletedTask() {
    return where((element) => element.isCompleted).toList();
  }
}
