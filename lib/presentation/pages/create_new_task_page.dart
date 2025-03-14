import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:task/core/constants/app_sizes.dart";
import "package:task/core/di/locator.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/core/utils/app_localization_helper.dart";
import "package:task/core/utils/date_formatter.dart";
import "package:task/core/utils/snackbar_util.dart";
import "package:task/domain/entity/task.dart";
import "package:task/presentation/cubits/task/task_add_cubit.dart";
import "package:task/presentation/cubits/task/task_list_cubit.dart";
import "package:task/presentation/widgets/shared/app_bar/my_app_bar.dart";
import "package:task/presentation/widgets/shared/input_field/build_task_form.dart";

class CreateNewTaskPage extends StatefulWidget {
  const CreateNewTaskPage({super.key});

  @override
  State<CreateNewTaskPage> createState() => _CreateNewTaskPageState();
}

class _CreateNewTaskPageState extends State<CreateNewTaskPage> {
  final _formKey = GlobalKey<FormState>();
  final _taskNameController = TextEditingController();
  final _taskDescriptionController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initDate();
  }

  void _initDate() {
    String currentDate = DateFormatter.defaultDateFormat();
    _startDateController.text = currentDate;
    _endDateController.text = currentDate;
  }

  void _initControllers() {
    _taskNameController.text = "";
    _taskDescriptionController.text = "";
    _startDateController.text = "";
    _endDateController.text = "";
    _initDate();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TaskAddCubit>(),
      child: Scaffold(
        appBar: const MyAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: AppSizes.paddingXL.h),
          child: Form(
            key: _formKey,
            child: BlocConsumer<TaskAddCubit, TaskAddState>(
              listener: (context, state) {
                if (state is TaskAddSuccess) {
                  context.read<TaskListCubit>().getTasks();
                  SnackbarUtil.showSuccess(context, "Successfully created");
                  _initControllers();
                } else if (state is TaskAddFailed) {
                  SnackbarUtil.showError(context, "Failed to created");
                }
              },
              builder: (context, state) {
                void handleCreateTask() {
                  if (_formKey.currentState!.validate()) {
                    String taskName = _taskNameController.text;
                    String taskDescription = _taskDescriptionController.text;
                    var startDate =
                        DateFormatter.parseDateFromStringByDefaultFormat(
                            _startDateController.text);
                    var endDate =
                        DateFormatter.parseDateFromStringByDefaultFormat(
                            _endDateController.text);
                    var task = TaskEntity(
                      title: taskName,
                      description: taskDescription,
                      startDate: startDate,
                      endDate: endDate,
                    );
                    context.read<TaskAddCubit>().addTask(task);
                  }
                }

                return BuildTaskForm(
                  taskNameController: _taskNameController,
                  taskDescriptionController: _taskDescriptionController,
                  startDateController: _startDateController,
                  endDateController: _endDateController,
                  buttonLabel: "createNewTask".tr(),
                  onTaskCreated: handleCreateTask,
                );
              },
            ),
          ),
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
