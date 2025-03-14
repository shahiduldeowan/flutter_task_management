import "package:flutter/material.dart";
import "package:task/core/constants/app_sizes.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/core/theme/theme_helper.dart";
import "package:task/core/utils/app_localization_helper.dart";
import "package:task/core/utils/app_size_utils.dart";
import "package:task/core/utils/navigator_service.dart";
import "package:task/presentation/widgets/shared/app_bar/custom_app_bar.dart";

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    this.height,
    this.title = "createNewTask",
    this.leading,
    this.isBack = false,
    this.actions,
  });

  final double? height;
  final String title;
  final Widget? leading;
  final bool isBack;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return CustomAppBarWidget(
      title: Padding(
        padding: EdgeInsets.only(left: AppSizes.paddingXL.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isBack)
              Padding(
                padding: EdgeInsets.only(right: 10.h),
                child: IconButton(
                  onPressed: () => NavigatorService.goBack(),
                  icon: Icon(Icons.adaptive.arrow_back_rounded),
                ),
              ),
            Text(
              title.tr(),
              style: theme.textTheme.titleLarge!.copyWith(
                fontSize: 18.fs,
              ),
            ),
          ],
        ),
      ),
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(AppSizeUtils.width, height ?? 56.h);
}
