import 'package:flutter/material.dart';

class Global {
  static double pr;

  void init(BuildContext context) {
    /// 设置自适应比例
    pr = MediaQuery.of(context).size.width / 375;
  }
}