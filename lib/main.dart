import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:task/presentation/app.dart";

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]).then((_) => runApp(const App()));
}
