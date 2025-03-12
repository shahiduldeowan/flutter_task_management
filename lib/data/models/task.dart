import "package:hive/hive.dart";
import "package:task/domain/entity/task.dart";

part "task.g.dart";

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final DateTime startDate;

  @HiveField(4)
  final DateTime endDate;

  @HiveField(5)
  final bool isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    this.isCompleted = false,
  });

  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      startDate: entity.startDate,
      endDate: entity.endDate,
      isCompleted: entity.isCompleted,
    );
  }

  TaskEntity toEntity() {
    return TaskEntity.id(
      id: id,
      title: title,
      description: description,
      startDate: startDate,
      endDate: endDate,
      isCompleted: isCompleted,
    );
  }
}
