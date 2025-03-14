import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:task/core/constants/app_sizes.dart";
import "package:task/core/di/locator.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/core/utils/app_localization_helper.dart";
import "package:task/core/utils/date_formatter.dart";
import "package:task/core/utils/navigator_service.dart";
import "package:task/core/utils/snackbar_util.dart";
import "package:task/domain/entity/task.dart";
import "package:task/presentation/cubits/task/task_delete_cubit.dart";
import "package:task/presentation/cubits/task/task_list_cubit.dart";
import "package:task/presentation/cubits/task/task_update_cubit.dart";
import "package:task/presentation/widgets/shared/app_bar/my_app_bar.dart";
import "package:task/presentation/widgets/shared/input_field/build_task_form.dart";
import "package:task/presentation/widgets/shared/task_status_button.dart";

class ViewTaskPage extends StatefulWidget {
  const ViewTaskPage({super.key, required this.task});

  final TaskEntity task;

  @override
  State<ViewTaskPage> createState() => _ViewTaskPageState();
}

class _ViewTaskPageState extends State<ViewTaskPage> {
  final _formKey = GlobalKey<FormState>();
  final _taskNameController = TextEditingController();
  final _taskDescriptionController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    String startDate = DateFormatter.defaultDateFormat(widget.task.startDate);
    String endDate = DateFormatter.defaultDateFormat(widget.task.endDate);

    _startDateController.text = startDate;
    _endDateController.text = endDate;

    _taskNameController.text = widget.task.title;
    _taskDescriptionController.text = widget.task.description;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<TaskUpdateCubit>()),
        BlocProvider(create: (_) => sl<TaskDeleteCubit>()),
      ],
      child: Scaffold(
        appBar: MyAppBar(
          title: "viewTask",
          isBack: true,
          actions: [
            BlocConsumer<TaskDeleteCubit, TaskDeleteState>(
              listener: (context, state) {
                if (state is TaskDeleteSuccess) {
                  context.read<TaskListCubit>().getTasks();
                  SnackbarUtil.showSuccess(context, "Successfully deleted");
                  NavigatorService.goBack();
                } else if (state is TaskDeleteFailed) {
                  SnackbarUtil.showError(context, "Failed to delete");
                }
              },
              builder: (context, state) => Padding(
                padding: EdgeInsets.only(right: AppSizes.paddingXL.h),
                child: TaskStatusButton(
                  task: widget.task,
                  isDeleteButton: true,
                  onPressed: () {
                    if (state is TaskDeleteLoading) return;
                    context.read<TaskDeleteCubit>().deleteTask(
                          widget.task.id,
                        );
                  },
                ),
              ),
            ),
          ],
        ),
        body: BlocConsumer<TaskUpdateCubit, TaskUpdateState>(
          listener: (context, state) {
            if (state is TaskUpdateSuccess) {
              context.read<TaskListCubit>().getTasks();
              SnackbarUtil.showSuccess(context, "Successfully update!");
              NavigatorService.goBack();
            } else if (state is TaskUpdateFailed) {
              SnackbarUtil.showError(context, "Failed to update");
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(top: AppSizes.paddingXL.h),
              child: Form(
                key: _formKey,
                child: BuildTaskForm(
                  taskNameController: _taskNameController,
                  taskDescriptionController: _taskDescriptionController,
                  startDateController: _startDateController,
                  endDateController: _endDateController,
                  onTaskCreated: state is TaskUpdateLoading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            if (widget.task.isCompleted) {
                              SnackbarUtil.showInfo(
                                  context, "The task is already completed!");
                              NavigatorService.goBack();
                              return;
                            }

                            String taskName = _taskNameController.text;
                            String taskDescription =
                                _taskDescriptionController.text;
                            var startDate = DateFormatter
                                .parseDateFromStringByDefaultFormat(
                                    _startDateController.text);
                            var endDate = DateFormatter
                                .parseDateFromStringByDefaultFormat(
                                    _endDateController.text);
                            var task = TaskEntity.id(
                              title: taskName,
                              description: taskDescription,
                              startDate: startDate,
                              endDate: endDate,
                              isCompleted: true,
                              id: widget.task.id,
                            );
                            context.read<TaskUpdateCubit>().updateTask(task);
                          }
                        },
                  buttonLabel: "complete".tr(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    _taskDescriptionController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }
}
