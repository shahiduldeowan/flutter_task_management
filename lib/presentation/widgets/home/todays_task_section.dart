import "package:flutter/material.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/core/theme/theme_helper.dart";
import "package:task/core/utils/app_localization_helper.dart";
import "package:task/presentation/widgets/home/animated_tab_bar.dart";
import "package:task/presentation/widgets/home/tab_bar_view.dart";

class TodaysTaskSectionWidget extends StatefulWidget {
  const TodaysTaskSectionWidget({super.key});

  @override
  State<TodaysTaskSectionWidget> createState() =>
      _TodaysTaskSectionWidgetState();
}

class _TodaysTaskSectionWidgetState extends State<TodaysTaskSectionWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "todayTasks".tr(),
            style: theme.textTheme.titleLarge,
          ),
          2.h.toHeightBox(),
          AnimatedTabBarWidget(controller: _tabController),
          12.h.toHeightBox(),
          TabBarViewWidget(controller: _tabController),
        ],
      ),
    );
  }
}
