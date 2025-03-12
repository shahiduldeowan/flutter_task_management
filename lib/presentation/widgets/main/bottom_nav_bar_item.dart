import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/svg.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/core/theme/theme_helper.dart" show theme, appTheme;
import "package:task/presentation/cubits/navigation/navigation_cubit.dart";

class BottomNavBarItemWidget extends StatelessWidget {
  const BottomNavBarItemWidget({
    super.key,
    required List<List<String>> icons,
    required this.index,
    required this.selectedIndex,
  }) : _icons = icons;

  final List<List<String>> _icons;
  final int index;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<NavigationCubit>().onTabChanged(index),
      child: AnimatedScale(
        scale: selectedIndex == index ? 1.0 : 0.9,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 60.h,
          width: 107.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.h),
            color: selectedIndex == index ? appTheme.iceGray : null,
          ),
          child: Center(
            child: SvgPicture.asset(
              selectedIndex == index ? _icons[index][1] : _icons[index][0],
              key: ValueKey<int>(selectedIndex),
              width: 24,
              height: 24,
              colorFilter: selectedIndex == index
                  ? ColorFilter.mode(
                      theme.colorScheme.primary,
                      BlendMode.srcIn,
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
