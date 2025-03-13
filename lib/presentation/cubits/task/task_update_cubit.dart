import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:task/core/utils/app_localization_helper.dart";
import "package:task/domain/entity/task.dart";
import "package:task/domain/use_case/update_task.dart";

part "task_update_state.dart";

@injectable
class TaskUpdateCubit extends Cubit<TaskUpdateState> {
  TaskUpdateCubit(this._updateTaskUseCase) : super(TaskUpdateInitial());

  final UpdateTaskUseCase _updateTaskUseCase;

  Future<void> updateTask(TaskEntity task) async {
    emit(TaskUpdateLoading());
    final result = await _updateTaskUseCase(task);
    result.fold(
      (failure) => emit(TaskUpdateFailed(message: failure.errorMessage)),
      (_) => emit(TaskUpdateSuccess(message: "taskUpdatedSuccessfully".tr())),
    );
  }
}
