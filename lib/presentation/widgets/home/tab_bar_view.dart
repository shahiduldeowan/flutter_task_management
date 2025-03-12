import "package:flutter/material.dart";
import "package:task/core/extensions/app_size_extension.dart";

class TabBarViewWidget extends StatelessWidget {
  const TabBarViewWidget({super.key, required this.controller});

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 446.h,
      child: TabBarView(
        controller: controller,
        children: [
          Container(
            color: Colors.red,
            child: const Center(
              child: Text("All Tasks"),
            ),
          ),
          Container(
            color: Colors.green,
            child: const Center(
              child: Text("Completed Tasks"),
            ),
          ),
        ],
      ),
    );
  }
}
