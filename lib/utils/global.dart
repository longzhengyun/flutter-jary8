import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Global {
  static double pr;

  static String getStaticPath() {
    return 'https://www.jary8.com';
  }

  static String formatDate(time, { String formatString = 'yyyy-MM-dd hh:mm:ss' }) {
    DateTime _dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    return DateFormat(formatString).format(_dateTime);
  }

  void init(BuildContext context) {
    /// 设置自适应比例
    pr = MediaQuery.of(context).size.width / 375;
  }
}