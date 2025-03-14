import "package:flutter/material.dart";
import "package:task/core/extensions/text_form_field_style_extension.dart";
import "package:task/core/theme/theme_helper.dart";

class BuildCustomTextFormField extends StatelessWidget {
  const BuildCustomTextFormField({
    super.key,
    required this.controller,
    this.focusNode,
    this.textStyle,
    this.readOnly = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.contentPadding,
    this.maxLength,
    this.suffix,
    this.onTap,
    this.buildCounte,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextStyle? textStyle;
  final bool readOnly;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final int? maxLines;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;
  final Widget? suffix;
  final void Function()? onTap;
  final Widget? Function(BuildContext,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounte;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      scrollPadding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      focusNode: focusNode,
      readOnly: readOnly,
      onTapOutside: (event) {
        if (focusNode != null) {
          focusNode?.unfocus();
        } else {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      style: textStyle ?? theme.textTheme.bodySmall,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      validator: validator,
      decoration: decoration(suffix: suffix),
      buildCounter: buildCounte,
      onTap: onTap,
    );
  }
}
