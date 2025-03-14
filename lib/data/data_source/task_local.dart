import "package:hive_flutter/hive_flutter.dart";
import "package:injectable/injectable.dart";
import "package:task/data/models/task.dart";
import "package:task/domain/entity/task.dart";

abstract class TaskLocalDataSource {
  Future<List<TaskEntity>> getTasks();
  Future<String> addTask(TaskEntity task);
  Future<String> updateTask(TaskEntity task);
  Future<String> deleteTask(String id);
}

@LazySingleton(as: TaskLocalDataSource)
class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final String _boxName = "tasks";

  /// Opens or gets the Hive box for tasks.
  Future<Box<TaskModel>> get _taskBox async =>
      await Hive.openBox<TaskModel>(_boxName);

  @override
  Future<List<TaskEntity>> getTasks() async {
    var box = await _taskBox;
    var tasks = box.values.toList();

    // If no tasks exist, add default tasks and refetch.
    if (tasks.isEmpty) {
      await _initializeTasks();
      return getTasks();
    }

    return tasks.map((t) => t.toEntity()).toList();
  }

  @override
  Future<String> addTask(TaskEntity task) async {
    var box = await _taskBox;
    await box.add(TaskModel.fromEntity(task));
    return "Task added successfully!";
  }

  @override
  Future<String> updateTask(TaskEntity task) async {
    var box = await _taskBox;
    final index = box.values.toList().indexWhere((t) => t.id == task.id);
    if (index != -1) {
      await box.putAt(index, TaskModel.fromEntity(task));
      return "Task updated successfully!";
    }
    return "Task not found!";
  }

  @override
  Future<String> deleteTask(String id) async {
    var box = await _taskBox;
    final index = box.values.toList().indexWhere((t) => t.id == id);

    if (index != -1) {
      await box.deleteAt(index);
      return "Task deleted successfully!";
    }
    return "Task not found!";
  }

  Future<void> _initializeTasks() async {
    var box = await _taskBox;
    var randomTaskList = [
      TaskEntity(
        title: "Implement Dark Mode",
        description: "Add a toggle switch to enable dark mode across the app.",
        startDate: DateTime(2025, 3, 5),
        endDate: DateTime(2025, 3, 7),
      ),
      TaskEntity(
        title: "Optimize API Calls",
        description:
            "Reduce redundant API calls and improve response time by caching results.",
        startDate: DateTime(2025, 3, 8),
        endDate: DateTime(2025, 3, 10),
        isCompleted: true,
      ),
      TaskEntity(
        title: "User Authentication Flow",
        description:
            "Revamp login/signup process with biometric authentication support.",
        startDate: DateTime(2025, 3, 11),
        endDate: DateTime(2025, 3, 15),
      ),
      TaskEntity(
        title: "Database Migration",
        description:
            "Migrate from SQLite to Firebase Firestore for real-time syncing.",
        startDate: DateTime(2025, 3, 16),
        endDate: DateTime(2025, 3, 20),
        isCompleted: true,
      ),
      TaskEntity(
        title: "Write Unit Tests",
        description:
            "Cover critical modules with unit tests to improve app stability.",
        startDate: DateTime(2025, 3, 21),
        endDate: DateTime(2025, 3, 25),
      ),
    ];

    for (var task in randomTaskList) {
      await box.add(TaskModel.fromEntity(task));
    }
  }
}
