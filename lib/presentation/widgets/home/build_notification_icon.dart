import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:task/core/constants/app_sizes.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/generated/assets.gen.dart";

class BuildNotificationIconWidget extends StatelessWidget {
  const BuildNotificationIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: AppSizes.paddingXL.h),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Notification action will be coming soon!"),
            ),
          );
        },
        child: SizedBox(
          height: AppSizes.paddingXL.h,
          width: AppSizes.paddingXXL.h,
          child: SvgPicture.asset(
            AppAssets.svg.bellIcon.path,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
