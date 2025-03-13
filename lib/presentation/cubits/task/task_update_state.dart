part of "task_update_cubit.dart";

sealed class TaskUpdateState extends Equatable {
  const TaskUpdateState({this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}

final class TaskUpdateInitial extends TaskUpdateState {}

final class TaskUpdateLoading extends TaskUpdateState {}

final class TaskUpdateSuccess extends TaskUpdateState {
  const TaskUpdateSuccess({super.message});
}

final class TaskUpdateFailed extends TaskUpdateState {
  const TaskUpdateFailed({super.message});
}
