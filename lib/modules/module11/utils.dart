import 'package:intl/intl.dart';

class Utils {
  static formatPrice(double price, {String currency = "\$"}) {
    return NumberFormat.currency(symbol: currency).format(price);
  }

  static formatPercent(double percent, {int digits = 1}) {
    return "${(percent * 100.0).toStringAsFixed(digits)}%";
  }

  static formatDate(DateTime date) {
    return DateFormat.yM().format(date);
  }
}
