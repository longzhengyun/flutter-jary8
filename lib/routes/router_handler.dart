import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:jaryapp/pages/article/article_detail.dart';
import 'package:jaryapp/pages/index.dart';
import 'package:jaryapp/pages/other_view.dart';
import 'package:jaryapp/pages/search/search.dart';

/// 主页
Handler indexHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Index();
});

/// 搜索
Handler searchHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Search();
});

/// 文章详情
Handler articleDetailHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String _id = params['id']?.first;
  return ArticleDetail(_id);
});

/// 外部站点webview
Handler otherViewHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String _url = params['url']?.first;
  String _title = params['title']?.first;
  return OtherView(_url, title: _title ?? '');
});