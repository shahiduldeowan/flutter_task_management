import "package:flutter/material.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/domain/entity/task.dart";
import "package:task/presentation/widgets/shared/build_task_card.dart";

class BuildTaskListView extends StatelessWidget {
  const BuildTaskListView({super.key, required this.taskList});
  final List<TaskEntity> taskList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: taskList.length,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (_, __) => SizedBox(height: 8.h),
      itemBuilder: (context, index) => BuildTaskCard(task: taskList[index]),
    );
  }
}
