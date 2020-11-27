import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:jaryapp/pages/article/article_detail.dart';
import 'package:jaryapp/pages/index.dart';
import 'package:jaryapp/pages/login/login.dart';
import 'package:jaryapp/pages/mine/about.dart';
import 'package:jaryapp/pages/mine/version.dart';
import 'package:jaryapp/pages/resume/evaluation.dart';
import 'package:jaryapp/pages/resume/experience.dart';
import 'package:jaryapp/pages/resume/other_info.dart';
import 'package:jaryapp/pages/resume/resume.dart';
import 'package:jaryapp/pages/resume/skill.dart';
import 'package:jaryapp/pages/webview/other_view.dart';
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

/// 关于佳瑞网
Handler aboutHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return About();
});

/// 大事记
Handler versionHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Version();
});

/// resume
Handler resumeHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Resume();
});

/// 职业评价
Handler evaluationHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Evaluation();
});

/// 职业技能
Handler skillHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Skill();
});

/// 工作经历
Handler experienceHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Experience();
});

/// 其他信息
Handler otherInfoHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return OtherInfo();
});

/// 登录
Handler loginHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Login();
});

/// 外部站点webview
Handler otherViewHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String _url = params['url']?.first;
  String _title = params['title']?.first;
  return OtherView(_url, title: _title ?? '');
});