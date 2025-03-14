import "package:flutter/material.dart";
import "package:task/generated/colors.gen.dart";

class AppColorSchemes {
  static final ColorScheme lightColorScheme = const ColorScheme.light(
    primary: AppColors.primaryColor,
    primaryContainer: AppColors.primaryContainerColor,
    onError: AppColors.onErrorColor,
    onPrimary: AppColors.onPrimaryColor,
  );
}

class LightCodeColors {
  Color get darkBlack => AppColors.fontDarkColor;

  Color get slateGray => AppColors.fontSlateGray;

  Color get stoneGray => AppColors.iconStoneGray;

  Color get green => AppColors.greenColor;

  Color get error => AppColors.errorColor;

  Color get iceGray => AppColors.iceGray;

  Color get appBorderGay => const Color(0xFFDCE1EF);
}
