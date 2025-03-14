import "package:flutter/material.dart";
import "package:task/core/constants/app_sizes.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/core/theme/app_decoration.dart";
import "package:task/core/theme/theme_helper.dart";
import "package:task/presentation/widgets/shared/input_field/build_custom_text_form_field.dart";

extension TextFormFieldStyleExtension on BuildCustomTextFormField {
  OutlineInputBorder get outlineGray => OutlineInputBorder(
        borderRadius: BorderRadiusStyles.roundedBorder20,
        borderSide: BorderSide(
          color: appTheme.appBorderGay.withValues(
            alpha: 0.49,
          ),
          width: 1,
        ),
      );

  InputDecoration decoration({Widget? suffix}) => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? theme.textTheme.bodySmall,
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.all(AppSizes.paddingMM.h),
        fillColor: theme.colorScheme.primaryContainer,
        filled: true,
        border: outlineGray,
        enabledBorder: outlineGray,
        focusedBorder: outlineGray,
        suffix: suffix,
        suffixIconConstraints: BoxConstraints(maxHeight: 48.h),
      );
}
