import "package:flutter/material.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/core/routes/app_routes.dart";
import "package:task/core/theme/app_decoration.dart";
import "package:task/core/theme/theme_helper.dart";
import "package:task/core/utils/app_localization_helper.dart";
import "package:task/core/utils/navigator_service.dart";
import "package:task/domain/entity/task.dart";

class TaskStatusButton extends StatelessWidget {
  final TaskEntity task;
  final bool isDeleteButton;
  final void Function()? onPressed;

  const TaskStatusButton({
    super.key,
    required this.task,
    this.isDeleteButton = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ??
          () => NavigatorService.pushNamed(AppRoutes.viewTaskPageRoute,
              arguments: task),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 6.h),
        backgroundColor: isDeleteButton
            ? const Color(0xFFFFE1E2)
            : task.isCompleted
                ? const Color(0xFFDEFFE8)
                : const Color(0xFFF0EDFD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyles.roundedBorder20,
        ),
      ),
      child: Text(
        isDeleteButton
            ? "delete".tr()
            : task.isCompleted
                ? "complete".tr()
                : "todo".tr(),
        style: theme.textTheme.labelLarge!.copyWith(
          color: isDeleteButton
              ? appTheme.error
              : task.isCompleted
                  ? appTheme.green
                  : theme.colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
