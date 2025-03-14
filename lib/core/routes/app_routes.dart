import "package:flutter/material.dart";
import "package:task/domain/entity/task.dart";
import "package:task/presentation/pages/main_page.dart";
import "package:task/presentation/pages/view_task_page.dart";

class AppRoutes {
  AppRoutes._();

  static const String initialRoute = "/";
  static const String viewTaskPageRoute = "/view_task_page/";

  static Route? onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      initialRoute => _mainPageBuilder(),
      viewTaskPageRoute =>
        _viewTaskPageBuilder(settings.arguments as TaskEntity),
      _ => null,
    };
  }

  static Route _mainPageBuilder() {
    return MaterialPageRoute(
      builder: (mainPageContext) {
        return const MainPage();
      },
    );
  }

  static Route _viewTaskPageBuilder(TaskEntity task) {
    return MaterialPageRoute(
      builder: (viewTAskPageContext) {
        return ViewTaskPage(task: task);
      },
    );
  }
}
