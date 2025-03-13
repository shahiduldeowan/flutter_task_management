import "package:flutter/material.dart";

class BuildCompletedTasksWidget extends StatelessWidget {
  const BuildCompletedTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text("Completed Tasks"),
      ),
    );
  }
}
