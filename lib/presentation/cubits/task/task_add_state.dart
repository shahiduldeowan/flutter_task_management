part of "task_add_cubit.dart";

sealed class TaskAddState extends Equatable {
  const TaskAddState({this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}

final class TaskAddInitial extends TaskAddState {}

final class TaskAddLoading extends TaskAddState {}

final class TaskAddSuccess extends TaskAddState {
  const TaskAddSuccess({super.message});
}

final class TaskAddFailed extends TaskAddState {
  const TaskAddFailed({super.message});
}
