import "package:flutter/material.dart";

class BuildAllTasksWidget extends StatelessWidget {
  const BuildAllTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: const Center(
        child: Text("All Tasks"),
      ),
    );
  }
}
