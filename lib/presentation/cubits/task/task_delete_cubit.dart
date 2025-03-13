import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:task/domain/use_case/delete_task.dart";

part "task_delete_state.dart";

class TaskDeleteCubit extends Cubit<TaskDeleteState> {
  TaskDeleteCubit(this._deleteTaskUseCase) : super(TaskDeleteInitial());

  final DeleteTaskUseCase _deleteTaskUseCase;

  Future<void> deleteTask(String id) async {
    emit(TaskDeleteLoading());
    final result = await _deleteTaskUseCase(id);
    result.fold(
      (message) => emit(TaskDeleteFailed(message: message.errorMessage)),
      (_) => emit(const TaskDeleteSuccess()),
    );
  }
}
