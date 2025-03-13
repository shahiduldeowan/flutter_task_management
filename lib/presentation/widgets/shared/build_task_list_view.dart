import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/presentation/cubits/task/task_list_cubit.dart";
import "package:task/presentation/widgets/shared/build_task_card.dart";

class BuildTaskListView extends StatelessWidget {
  const BuildTaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskListCubit, TaskListState>(
      builder: (context, state) {
        // final tasks = state.tasks
        //     .where((task) => showCompleted ? task.isCompleted : true)
        //     .toList();

        // if (tasks.isEmpty) {
        //   return const Center(child: Text("No tasks available"));
        // }

        return ListView.separated(
          itemCount: 2,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (_, __) => SizedBox(height: 8.h),
          itemBuilder: (context, index) => const BuildTaskCard(),
        );
      },
    );
  }
}
