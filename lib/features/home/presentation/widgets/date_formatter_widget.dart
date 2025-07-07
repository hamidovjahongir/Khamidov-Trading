import 'package:intl/intl.dart';

class DateFormatter {
  // Uzbek tilida oy nomlari
  static const Map<int, String> uzbekMonths = {
    1: 'Yanvar',
    2: 'Fevral', 
    3: 'Mart',
    4: 'Aprel',
    5: 'May',
    6: 'Iyun',
    7: 'Iyul',
    8: 'Avgust',
    9: 'Sentyabr',
    10: 'Oktyabr',
    11: 'Noyabr',
    12: 'Dekabr',
  };

  // DateTime'ni "23-Sentyabr" formatiga o'tkazish
  static String formatToUzbek(DateTime date) {
    final day = date.day;
    final month = uzbekMonths[date.month] ?? 'Noma\'lum';
    return '$day-$month';
  }

  // String date'ni parse qilib, uzbek formatiga o'tkazish
  static String parseAndFormatToUzbek(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return 'No Date';
    }
    
    try {
      DateTime date = DateTime.parse(dateString);
      return formatToUzbek(date);
    } catch (e) {
      // Agar parse qilib bo'lmasa, default format
      return dateString;
    }
  }

  // Hozirgi vaqtni uzbek formatida qaytarish
  static String getCurrentDateUzbek() {
    return formatToUzbek(DateTime.now());
  }

  // Yil bilan birga format: "23-Sentyabr, 2024"
  static String formatToUzbekWithYear(DateTime date) {
    final day = date.day;
    final month = uzbekMonths[date.month] ?? 'Noma\'lum';
    final year = date.year;
    return '$day-$month, $year';
  }
}

// Widget'da ishlatish uchun extension
extension DateExtension on DateTime {
  String toUzbekFormat() {
    return DateFormatter.formatToUzbek(this);
  }
  
  String toUzbekFormatWithYear() {
    return DateFormatter.formatToUzbekWithYear(this);
  }
}

