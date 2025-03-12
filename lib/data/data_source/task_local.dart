import "package:hive_flutter/hive_flutter.dart";
import "package:injectable/injectable.dart";
import "package:task/data/models/task.dart";
import "package:task/domain/entity/task.dart";

abstract class TaskLocalDataSource {
  Future<List<TaskEntity>> getTasks();
  Future<void> addTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<void> deleteTask(String id);
}

@LazySingleton(as: TaskLocalDataSource)
class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final String _boxName = "tasks";
  Future<Box<TaskModel>> get _taskBox async =>
      await Hive.openBox<TaskModel>(_boxName);

  @override
  Future<void> addTask(TaskEntity task) async {
    var box = await _taskBox;
    await box.add(TaskModel.fromEntity(task));
  }

  @override
  Future<List<TaskEntity>> getTasks() async {
    var box = await _taskBox;
    var tasks = box.values.toList();
    return tasks.isNotEmpty ? tasks.map((t) => t.toEntity()).toList() : [];
  }

  @override
  Future<void> deleteTask(String id) async {
    var box = await _taskBox;
    final index = box.values.toList().indexWhere((t) => t.id == id);
    if (index != -1) {
      await box.deleteAt(index);
    }
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    var box = await _taskBox;
    final index = box.values.toList().indexWhere((t) => t.id == task.id);
    if (index != -1) {
      await box.putAt(index, TaskModel.fromEntity(task));
    }
  }
}
