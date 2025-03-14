import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/core/utils/app_localization_helper.dart";
import "package:task/presentation/cubits/task/task_list_cubit.dart";
import "package:task/presentation/widgets/shared/adaptive_circular_progress_indicator.dart";
import "package:task/presentation/widgets/shared/app_bar/my_app_bar.dart";
import "package:task/presentation/widgets/shared/build_task_card.dart";
import "package:task/presentation/widgets/shared/empty_widget.dart";

class AllTaskPage extends StatelessWidget {
  const AllTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "allTasks".tr()),
      body: BlocBuilder<TaskListCubit, TaskListState>(
        builder: (context, state) {
          if (state is TaskListLoading) {
            return const AdaptiveCircularProgressIndicator();
          }
          if (state is TaskListLoaded && state.tasks?.isNotEmpty != null) {
            return ListView.separated(
              padding: EdgeInsets.all(20.h),
              itemBuilder: (context, index) => BuildTaskCard(
                task: state.tasks![index],
              ),
              separatorBuilder: (context, index) => 8.h.toHeightBox(),
              itemCount: state.tasks!.length,
            );
          }
          return const EmptyWidget();
        },
      ),
    );
  }
}
