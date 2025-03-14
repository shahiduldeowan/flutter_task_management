import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/core/extensions/task_extension.dart";
import "package:task/core/theme/app_decoration.dart";
import "package:task/core/theme/theme_helper.dart" show appTheme, theme;
import "package:task/core/utils/app_localization_helper.dart";
import "package:task/presentation/cubits/task/task_list_cubit.dart";

class BuildSummaryWidget extends StatelessWidget {
  const BuildSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "summary".tr(),
            style: theme.textTheme.titleLarge,
          ),
          12.h.toHeightBox(),
          _buildTaskStats(),
        ],
      ),
    );
  }

  Widget _buildTaskStats() {
    return BlocBuilder<TaskListCubit, TaskListState>(
      builder: (context, state) {
        int assignedTask = 0;
        int completedTask = 0;

        if (state is TaskListLoaded && state.tasks != null) {
          var summary = state.tasks!.getSummary();
          assignedTask = summary.assignedTask;
          completedTask = summary.completedTask;
        }

        return SizedBox(
          width: double.maxFinite,
          child: Row(
            children: [
              _buildTaskCard(
                label: "assignedTasks".tr(),
                count: "$assignedTask",
                backgroundColor: AppDecoration.primary50,
                textColor: theme.colorScheme.primary,
              ),
              _buildTaskCard(
                label: "completedTasks".tr(),
                count: "$completedTask",
                backgroundColor: AppDecoration.green50,
                textColor: appTheme.green,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTaskCard({
    required String label,
    required String count,
    required BoxDecoration backgroundColor,
    required Color textColor,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12.h),
        margin: EdgeInsets.symmetric(horizontal: 4.h),
        decoration: backgroundColor.copyWith(
          borderRadius: BorderRadiusStyles.roundedBorder12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: theme.textTheme.bodyMedium,
            ),
            Text(
              count,
              style: theme.textTheme.headlineSmall!.copyWith(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
