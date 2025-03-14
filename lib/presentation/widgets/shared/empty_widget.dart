import "package:flutter/material.dart";
import "package:task/core/constants/app_sizes.dart";
import "package:task/core/extensions/app_size_extension.dart";

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    this.message = "No tasks available",
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(
          fontSize: AppSizes.fontXS.fs,
          color: Colors.grey,
        ),
      ),
    );
  }
}
