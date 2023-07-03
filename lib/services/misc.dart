
import 'package:intl/intl.dart';

class Misc{
  static String formatDateTime(DateTime dateTime) {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd hh:mm a');
    return dateFormat.format(dateTime);
  }
}