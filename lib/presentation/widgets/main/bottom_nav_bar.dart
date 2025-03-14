import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:task/core/constants/app_sizes.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/generated/assets.gen.dart";
import "package:task/presentation/cubits/navigation/navigation_cubit.dart";
import "package:task/presentation/widgets/main/bottom_nav_bar_item.dart";

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  /// List of icons: [Unselected, Selected]
  static final List<List<String>> _icons = [
    [AppAssets.svg.homeIcon.path, AppAssets.svg.homeFilledIcon.path],
    [AppAssets.svg.taskIcon.path, AppAssets.svg.taskIconFilled.path],
    [AppAssets.svg.calenderIcon.path, AppAssets.svg.calenderFilledIcon.path],
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return SafeArea(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 14.h),
            padding: EdgeInsets.all(4.h),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusXXXL.h),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.onPrimary.withValues(
                        alpha: 0.2,
                      ),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                _icons.length,
                (index) {
                  return BottomNavBarItemWidget(
                    icons: _icons,
                    index: index,
                    selectedIndex: state.selectedIndex,
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
