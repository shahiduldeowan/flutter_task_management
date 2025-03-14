import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:task/domain/use_case/delete_task.dart";

part "task_delete_state.dart";

@injectable
class TaskDeleteCubit extends Cubit<TaskDeleteState> {
  TaskDeleteCubit(this._deleteTaskUseCase) : super(TaskDeleteInitial());

  final DeleteTaskUseCase _deleteTaskUseCase;

  Future<void> deleteTask(String id) async {
    emit(TaskDeleteLoading());
    final result = await _deleteTaskUseCase(param: id);
    result.fold(
      (message) => emit(TaskDeleteFailed(message: message.errorMessage)),
      (_) => emit(const TaskDeleteSuccess()),
    );
  }
}
