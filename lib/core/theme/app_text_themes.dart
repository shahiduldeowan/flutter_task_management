import "package:flutter/material.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/core/theme/theme_helper.dart";
import "package:task/generated/fonts.gen.dart";

class AppTextThemes {
  static TextTheme textTheme() => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.darkBlack,
          fontSize: 16.fs,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.darkBlack,
          fontSize: 14.fs,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          color: appTheme.slateGray,
          fontSize: 12.fs,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.darkBlack,
          fontSize: 32.fs,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w800,
        ),
        headlineMedium: TextStyle(
          color: appTheme.darkBlack,
          fontSize: 28.fs,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: appTheme.darkBlack,
          fontSize: 24.fs,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w800,
        ),
        labelLarge: TextStyle(
          color: appTheme.darkBlack,
          fontSize: 12.fs,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: appTheme.darkBlack,
          fontSize: 10.fs,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          color: appTheme.darkBlack,
          fontSize: 8.fs,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: appTheme.darkBlack,
          fontSize: 20.fs,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: appTheme.darkBlack,
          fontSize: 16.fs,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: appTheme.darkBlack,
          fontSize: 14.fs,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w700,
        ),
      );
}
