part of "task_delete_cubit.dart";

sealed class TaskDeleteState extends Equatable {
  const TaskDeleteState({this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}

final class TaskDeleteInitial extends TaskDeleteState {}

final class TaskDeleteLoading extends TaskDeleteState {}

final class TaskDeleteSuccess extends TaskDeleteState {
  const TaskDeleteSuccess({super.message});
}

final class TaskDeleteFailed extends TaskDeleteState {
  const TaskDeleteFailed({super.message});
}
