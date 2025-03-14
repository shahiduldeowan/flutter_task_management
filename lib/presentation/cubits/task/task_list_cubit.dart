import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:task/domain/entity/task.dart";
import "package:task/domain/use_case/get_tasks.dart";

part "task_list_state.dart";

@injectable
class TaskListCubit extends Cubit<TaskListState> {
  TaskListCubit(this._getTasksUseCase) : super(TaskListInitial());
  final GetTasksUseCase _getTasksUseCase;

  void getTasks() async {
    // Emit loading state if not already in loading or loaded state
    if (state is! TaskListLoading) emit(TaskListLoading());

    final result = await _getTasksUseCase();
    result.fold(
      // Emit error state if failure occurs
      (failure) => emit(TaskListError(errorMessage: failure.errorMessage)),

      // If tasks are successfully fetched, update the state
      (tasks) {
        if (tasks.isNotEmpty) {
          tasks.sort((a, b) => b.startDate.compareTo(a.startDate));
        }

        if (state is TaskListLoaded) {
          emit((state as TaskListLoaded).copyWith(tasks: tasks));
        } else {
          emit(TaskListLoaded(tasks: tasks));
        }
      },
    );
  }
}
