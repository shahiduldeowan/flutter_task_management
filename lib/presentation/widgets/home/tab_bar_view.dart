import "package:flutter/material.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/presentation/widgets/home/build_all_tasks.dart";
import "package:task/presentation/widgets/home/build_completed_tasks.dart";

class TabBarViewWidget extends StatelessWidget {
  const TabBarViewWidget({super.key, required this.controller});

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 446.h,
      child: TabBarView(
        controller: controller,
        children: const [BuildAllTasksWidget(), BuildCompletedTasksWidget()],
      ),
    );
  }
}
