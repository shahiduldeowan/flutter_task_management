import "package:flutter/material.dart";
import "package:task/presentation/pages/main_page.dart";

class AppRoutes {
  AppRoutes._();

  static const String initialRoute = "/";

  static Route? onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      initialRoute => _mainPageBuilder(),
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
}
