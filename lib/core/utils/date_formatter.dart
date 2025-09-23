import 'package:intl/intl.dart';

class DateFormatter {
  static String timeHm(String iso) {
    return DateFormat('HH:mm').format(DateTime.parse(iso));
  }
}
