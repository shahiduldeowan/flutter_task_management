import "package:intl/intl.dart";

class DateFormatter {
  static String formatDefault([DateTime? date]) {
    return DateFormat("dd MMM, yyyy").format(date ?? DateTime.now());
  }
}
