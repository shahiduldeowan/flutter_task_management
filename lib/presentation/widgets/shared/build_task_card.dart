import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/core/theme/app_decoration.dart";
import "package:task/core/theme/theme_helper.dart";
import "package:task/core/utils/date_formatter.dart";
import "package:task/domain/entity/task.dart";
import "package:task/generated/assets.gen.dart";
import "package:task/presentation/widgets/shared/task_status_button.dart";

class BuildTaskCard extends StatelessWidget {
  const BuildTaskCard({super.key, required this.task});
  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.h),
      decoration: AppDecoration.outlinedGrayBoxDecoration.copyWith(
        borderRadius: BorderRadiusStyles.roundedBorder12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(task.title, style: theme.textTheme.titleMedium),
          Text(
            task.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall!.copyWith(height: 1.4),
          ),
          8.h.toHeightBox(),
          Row(
            children: [
              _TaskDate(date: task.startDate),
              TaskStatusButton(task: task),
            ],
          ),
        ],
      ),
    );
  }
}

class _TaskDate extends StatelessWidget {
  final DateTime date;

  const _TaskDate({required this.date});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.svg.clockIcon.path,
            height: 12.h,
            width: 12.h,
          ),
          4.h.toWidthBox(),
          Text(
            DateFormatter.formatDateWithMonthDayYear(date),
            style: theme.textTheme.bodySmall!.copyWith(fontSize: 10.fs),
          ),
        ],
      ),
    );
  }
}
