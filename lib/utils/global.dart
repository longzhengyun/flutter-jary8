import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Global {
  static double pr;

  static String getStaticPath() {
    return 'https://www.jary8.com';
  }

  static String formatDate(int time, { String formatString = 'yyyy-MM-dd hh:mm:ss' }) {
    DateTime _dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    return DateFormat(formatString).format(_dateTime);
  }

  static String formatYear(String date, { int scale = 1000 * 60 * 60 * 24 * 365 }) {
    int _time = DateTime.parse(date).millisecondsSinceEpoch;
    int _nowTime = DateTime.now().millisecondsSinceEpoch;
    return ((_nowTime - _time) / scale).round().toString();
  }

  void init(BuildContext context) {
    /// 设置自适应比例
    pr = MediaQuery.of(context).size.width / 375;
  }
}