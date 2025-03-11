import "package:flutter/material.dart";
import "package:task/core/theme/app_color_schemes.dart";
import "package:task/core/theme/app_text_themes.dart";
import "package:task/generated/colors.gen.dart";

LightCodeColors get appTheme => ThemeHelper().themeColors();

ThemeData get theme => ThemeHelper().getThemeData();

class ThemeHelper {
  ThemeData getThemeData() {
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: AppColorSchemes.lightColorScheme,
      scaffoldBackgroundColor: AppColors.gradientRightColor,
      textTheme: AppTextThemes.textTheme(),
    );
  }

  LightCodeColors themeColors() => LightCodeColors();
}
