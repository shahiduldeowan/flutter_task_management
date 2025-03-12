import "package:equatable/equatable.dart";
import "package:task/data/models/task.dart";
import "package:uuid/uuid.dart";

class TaskEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final bool isCompleted;

  TaskEntity({
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    this.isCompleted = false,
  }) : id = const Uuid().v4();

  const TaskEntity.id({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    this.isCompleted = false,
  });

  factory TaskEntity.fromModel(TaskModel model) {
    return TaskEntity(
      title: model.title,
      description: model.description,
      startDate: model.startDate,
      endDate: model.endDate,
      isCompleted: model.isCompleted,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        startDate,
        endDate,
        isCompleted,
      ];
}
