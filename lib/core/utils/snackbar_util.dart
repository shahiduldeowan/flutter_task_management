import "package:flutter/material.dart";

class SnackbarUtil {
  static void show(BuildContext context, String message,
      {Color? backgroundColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: backgroundColor ?? Colors.black87,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void showSuccess(BuildContext context, String message) {
    show(context, "✅ $message", backgroundColor: Colors.green);
  }

  static void showError(BuildContext context, String message) {
    show(context, "❌ $message", backgroundColor: Colors.red);
  }

  static void showInfo(BuildContext context, String message) {
    show(context, "ℹ️ $message", backgroundColor: Colors.blue);
  }

  static void showWarning(BuildContext context, String message) {
    show(context, "⚠️ $message", backgroundColor: Colors.orange);
  }
}
