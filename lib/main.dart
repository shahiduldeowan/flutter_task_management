import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:task/core/di/locator.dart";
import "package:task/presentation/app.dart";

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]).then((_) {
    configureDependencies();
    runApp(const App());
  });
}

// flutter pub run build_runner build --delete-conflicting-outputs
// flutter pub run build_runner watch --delete-conflicting-outputs
