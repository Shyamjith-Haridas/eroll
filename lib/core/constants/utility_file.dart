import 'package:intl/intl.dart';

class UtilityFile {
  static dynamic formatDate(DateTime date) {
    final formattedDate = DateFormat.MMMd().format(date);
    return formattedDate;
  }

  static dynamic currentDay(DateTime date) {
    final currentDay = DateFormat.EEEE().format(date);
    return currentDay;
  }

  static dynamic formatDateMonthYear(DateTime date) {
    final formattedDate = DateFormat.yMMMMd().format(date);
    return formattedDate;
  }
}
