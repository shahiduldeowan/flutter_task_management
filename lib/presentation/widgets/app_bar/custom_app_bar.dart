import "package:flutter/material.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/core/utils/app_size_utils.dart";

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
    this.height,
    required this.shape,
    this.leadingWidth,
    this.leading,
    this.actions,
    this.title,
    this.centerTitle,
  });

  final double? height;
  final ShapeBorder shape;
  final double? leadingWidth;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? title;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) => AppBar(
        elevation: 0,
        shape: shape,
        toolbarHeight: height ?? 56.h,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leadingWidth: leadingWidth ?? 0,
        leading: leading,
        title: title,
        titleSpacing: 0,
        centerTitle: centerTitle ?? false,
        actions: actions,
      );

  @override
  Size get preferredSize => Size(AppSizeUtils.width, height ?? 56.h);
}
