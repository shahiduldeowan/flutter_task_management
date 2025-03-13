import "package:intl/intl.dart";

class DateFormatter {
  /// Format a date as "dd MMM, yyyy" (e.g. "18 Nov, 2025").
  ///
  /// If [date] is null, the current date is used.
  static String defaultDateFormat([DateTime? date]) {
    return DateFormat("dd MMM, yyyy").format(date ?? DateTime.now());
  }

  /// Format a date as "MMMM d, y" (e.g. "November 18, 2025").
  ///
  /// If [date] is null, the current date is used.
  static String formatDateWithMonthDayYear([DateTime? date]) {
    return DateFormat("MMMM d, y").format(date ?? DateTime.now());
  }
}
