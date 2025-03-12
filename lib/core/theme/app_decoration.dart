import "package:flutter/material.dart";
import "package:task/core/theme/theme_helper.dart" show theme;
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
}
