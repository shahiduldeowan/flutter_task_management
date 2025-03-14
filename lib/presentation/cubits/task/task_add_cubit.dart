import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:task/core/utils/app_localization_helper.dart";
import "package:task/domain/entity/task.dart";
import "package:task/domain/use_case/add_task.dart";

part "task_add_state.dart";

@injectable
class TaskAddCubit extends Cubit<TaskAddState> {
  TaskAddCubit(this._addTaskUseCase) : super(TaskAddInitial());

  final AddTaskUseCase _addTaskUseCase;

  Future<void> addTask(TaskEntity task) async {
    emit(TaskAddLoading());
    final result = await _addTaskUseCase(param: task);
    result.fold(
      (failure) => emit(TaskAddFailed(message: failure.errorMessage)),
      (_) => emit(TaskAddSuccess(message: "taskAddedSuccessfully".tr())),
    );
  }
}
