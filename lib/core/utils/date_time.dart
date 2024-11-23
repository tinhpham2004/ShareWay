// ignore_for_file: constant_identifier_names

import 'package:intl/intl.dart';

extension FormatDate on DateTime {
  String format({String? locale, required String pattern}) {
    return DateFormat(pattern, locale).format(toLocal());
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isToday() {
    final now = DateTime.now();
    return isSameDay(now);
  }
}

const dd_mm_yyyy = 'dd/MM/yyyy';
const dd_mm_yy = 'dd/MM/yy';
const EEEE_dd_MMM = 'EEEE, dd MMM';
const EEEE = 'EEEE';
const dd_mm = 'dd/MM';
const yyyy_mm_dd = 'yyyy-MM-dd';
const mm_yyyy = 'MM/yyyy';
const hh_mm_dd_MM_yyyy = 'HH:mm, $dd_mm_yyyy';
const dd_MM_yyyy_hh_mm = '$dd_mm_yyyy HH:mm';
const yyyy_mm = 'yyyy-MM';
const EEEE_dd_MM_yyyy = 'EEEE, $dd_mm_yyyy';
const EEEE_hh_mm_dd_MM_yyyy = 'EEEE, HH:mm - $dd_mm_yyyy';
const hh_mm = 'HH:mm';
const hh_mm_a = 'hh:mm a';
