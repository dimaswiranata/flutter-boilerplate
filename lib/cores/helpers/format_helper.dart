import 'package:intl/intl.dart';

class FormatHelper {
  FormatHelper._();
  static String? number(int value, [int decimal = 0]) {
    final number = NumberFormat.decimalPercentPattern(
        locale: null, decimalDigits: decimal);
    return number.format(value);
  }

  static String? currency(int value,
      {String symbol = '', int decimal = 0, String locale = 'id'}) {
    final number = NumberFormat.currency(
        locale: locale, decimalDigits: decimal, symbol: symbol);
    return number.format(value);
  }

  static String? dateTime(String value, EnumDateTime type) {
    if (value.isEmpty) return '';
    DateTime convertedDate = DateTime.parse(value);
    return DateFormat(type.str).format(convertedDate);
  }

  static String phoneNumber(String phone) {
    return '${phone.substring(0, 3)} ${phone.substring(3, 6)} ${phone.substring(6, 10)} ${phone.substring(10, phone.length)}';
  }
}

enum EnumDateTime {
  day('EEEE'),
  shortDay('EEE'),
  dateDay('dd'),
  dateMonth('dd MMM'),
  month('MMMM'),
  monthYear('MMMM yyyy'),
  shortMonth('MMM'),
  year('yyyy'),
  hours('HH'),
  minutes('mm'),
  time1('H:mm'),
  time2('HH:mm'),
  time3('H:mm a'),
  dateShort1('dd/MM/yyyy'),
  dateShort2('dd MMM yyyy'),
  dateShort3('dd MMMM yyyy'),
  dateShort4('dd-MM-yyyy'),
  dateShort5('dd-MMM-yyyy'),
  dateShort6('dd-MMMM-yyyy'),
  dateShort7('yyyy-MM-dd'),
  dateLong1('dd MMMM yyyy'),
  dateLong2('dd, MMMM yyyy'),
  dateLong3('dd, MMM yyyy'),
  dateLong4('dd, MMMM yyyy'),
  dateLong5('dd, MMM yyyy'),
  dateTime1('dd MMM yyyy • H:mm'),
  dateTime2('dd, MMM yyyy • H:mm');

  final String str;
  const EnumDateTime(this.str);
}
