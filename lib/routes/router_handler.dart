import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:jaryapp/pages/index.dart';

/// 主页
Handler indexHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Index();
});