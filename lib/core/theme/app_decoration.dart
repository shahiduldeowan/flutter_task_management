import "package:flutter/material.dart";
import "package:task/core/constants/app_sizes.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/core/theme/theme_helper.dart" show appTheme, theme;
import "package:task/generated/colors.gen.dart";

class AppDecoration {
  static BoxDecoration get gradientBackground => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.5, 0),
          end: const Alignment(0.5, 0.37),
          colors: [
            theme.colorScheme.primaryContainer,
            AppColors.gradientRightColor,
          ],
        ),
      );

  static BoxDecoration get outlinedGrayBoxDecoration => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadiusStyles.roundedBorder20,
        border: Border.all(
          color: appTheme.appBorderGay,
          width: 1.h,
        ),
      );

  static BoxDecoration get filledPrimaryContainerBoxDecoration => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadiusStyles.roundedBorder16,
      );

  static BoxDecoration get primary50 => BoxDecoration(
        color: const Color(0xFFF0EDFD),
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );

  static BoxDecoration get green50 => BoxDecoration(
        color: const Color(0xFFDEFFE8),
        border: Border.all(
          color: appTheme.green,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyles {
  static BorderRadius get roundedBorder12 =>
      BorderRadius.circular(AppSizes.borderRadiusM.h);

  static BorderRadius get roundedBorder14 =>
      BorderRadius.circular(AppSizes.borderRadiusMM.h);

  static BorderRadius get roundedBorder16 =>
      BorderRadius.circular(AppSizes.borderRadiusL.h);

  static BorderRadius get roundedBorder20 =>
      BorderRadius.circular(AppSizes.borderRadiusXL.h);

  static BorderRadius get roundedBorder34 =>
      BorderRadius.circular(AppSizes.borderRadiusXXXL.h);
}
