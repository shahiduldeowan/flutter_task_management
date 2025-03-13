part of "task_list_cubit.dart";

sealed class TaskListState extends Equatable {
  const TaskListState({this.tasks, this.errorMessage});

  final List<TaskEntity>? tasks;
  final String? errorMessage;

  @override
  List<Object?> get props => [tasks, errorMessage];
}

final class TaskListInitial extends TaskListState {}

final class TaskListLoading extends TaskListState {}

final class TaskListError extends TaskListState {
  const TaskListError({super.errorMessage});
}

final class TaskListLoaded extends TaskListState {
  const TaskListLoaded({super.tasks});

  TaskListLoaded copyWith({List<TaskEntity>? tasks}) {
    return TaskListLoaded(tasks: tasks ?? tasks);
  }
}
