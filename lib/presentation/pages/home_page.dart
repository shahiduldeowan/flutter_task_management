import "package:flutter/material.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/core/theme/theme_helper.dart";
import "package:task/core/utils/app_localization_helper.dart";
import "package:task/core/utils/date_formatter.dart";
import "package:task/presentation/widgets/app_bar/custom_app_bar.dart";
import "package:task/presentation/widgets/home/build_notification_icon.dart";
import "package:task/presentation/widgets/home/build_summary.dart";
import "package:task/presentation/widgets/home/todays_task_section.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBarWidget(
      title: Padding(
        padding: EdgeInsets.only(left: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "goodMorning".tr(),
              style: theme.textTheme.bodySmall,
            ),
            Text(
              DateFormatter.formatDefault(),
              style: theme.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      actions: [const BuildNotificationIconWidget()],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20.h,
        children: const [
          BuildSummaryWidget(),
          TodaysTaskSectionWidget(),
        ],
      ),
    );
  }
}
