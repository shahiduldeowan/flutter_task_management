import "package:flutter/material.dart";

class NavigatorService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<Object?>? pushNamed(
    String routeName, {
    Object? arguments,
  }) =>
      navigatorKey.currentState?.pushNamed(
        routeName,
        arguments: arguments,
      );

  static void goBack() => navigatorKey.currentState?.pop();
}
