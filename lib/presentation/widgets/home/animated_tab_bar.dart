import "package:flutter/material.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/core/theme/app_decoration.dart";
import "package:task/core/theme/theme_helper.dart";
import "package:task/core/utils/app_localization_helper.dart";

class AnimatedTabBarWidget extends StatelessWidget {
  const AnimatedTabBarWidget({super.key, required this.controller});

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 40.h,
      padding: EdgeInsets.all(6.h),
      decoration: AppDecoration.outlinedGrayBoxDecoration,
      child: ClipRRect(
        borderRadius: BorderRadiusStyles.roundedBorder20,
        child: TabBar(
          controller: controller,
          labelPadding: EdgeInsets.zero,
          labelColor: theme.colorScheme.primaryContainer,
          labelStyle: theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelColor: appTheme.slateGray,
          unselectedLabelStyle: theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
          ),
          indicator: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadiusStyles.roundedBorder20,
          ),
          indicatorSize: TabBarIndicatorSize.label,
          dividerColor: Colors.transparent,
          onTap: (index) {},
          tabs: List.generate(
            2,
            (index) {
              return AnimatedTab(
                text: (index == 0 ? "allTasks" : "completed").tr(),
                controller: controller,
              );
            },
          ),
        ),
      ),
    );
  }
}

class AnimatedTab extends StatelessWidget {
  final String text;

  final TabController controller;

  const AnimatedTab({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller.animation!,
        builder: (context, child) {
          double scale = Tween<double>(begin: 0.9, end: 1.0)
              .animate(
                CurvedAnimation(
                  parent: controller.animation!,
                  curve: Curves.easeInOut,
                ),
              )
              .value;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: double.maxFinite,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Transform.scale(
              scale: scale,
              child: Text(text),
            ),
          );
        });
  }
}
