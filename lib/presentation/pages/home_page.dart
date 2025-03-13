import "package:flutter/material.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/core/theme/theme_helper.dart";
import "package:task/core/utils/app_localization_helper.dart";
import "package:task/core/utils/date_formatter.dart";
import "package:task/presentation/widgets/app_bar/custom_app_bar.dart";
import "package:task/presentation/widgets/home/animated_tab_bar.dart";
import "package:task/presentation/widgets/home/build_notification_icon.dart";
import "package:task/presentation/widgets/home/build_summary.dart";
import "package:task/presentation/widgets/shared/build_task_list_view.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;
  static final EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 20.h);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: NestedScrollView(
        headerSliverBuilder: (_, __) => [
          SliverToBoxAdapter(
            child: Padding(
              padding: _padding.copyWith(top: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BuildSummaryWidget(),
                  20.h.toHeightBox(),
                  Text("todayTasks".tr(), style: theme.textTheme.titleLarge),
                  2.h.toHeightBox(),
                  AnimatedTabBarWidget(controller: _tabController),
                  12.h.toHeightBox(),
                ],
              ),
            ),
          ),
        ],
        body: Padding(
          padding: _padding,
          child: TabBarView(
            controller: _tabController,
            children: const [
              BuildTaskListView(),
              BuildTaskListView(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBarWidget(
      title: Padding(
        padding: EdgeInsets.only(left: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("goodMorning".tr(), style: theme.textTheme.bodySmall),
            Text(
              DateFormatter.defaultDateFormat(),
              style: theme.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      actions: const [BuildNotificationIconWidget()],
    );
  }
}
