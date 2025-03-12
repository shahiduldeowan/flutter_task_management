import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/core/theme/app_decoration.dart";
import "package:task/core/theme/theme_helper.dart";
import "package:task/core/utils/app_localization_helper.dart";
import "package:task/presentation/cubits/home/home_tab_cubit.dart";

class AnimatedTabBarWidget extends StatelessWidget {
  const AnimatedTabBarWidget({super.key, required this.controller});

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubit, HomeTabState>(
      builder: (context, state) {
        return Container(
          width: double.maxFinite,
          height: 40.h,
          padding: EdgeInsets.all(6.h),
          decoration: AppDecoration.tabBoxDecoration,
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
              onTap: (index) {
                context.read<HomeTabCubit>().onTabChanged(index);
              },
              tabs: List.generate(
                2,
                (index) {
                  return AnimatedTab(
                    text: (index == 0 ? "allTasks" : "completed").tr(),
                    isSelected: state.selectedIndex == index,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class AnimatedTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const AnimatedTab({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: double.maxFinite,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Transform.scale(
        scale: isSelected ? 1.0 : 0.9,
        child: Text(text),
      ),
    );
  }
}
