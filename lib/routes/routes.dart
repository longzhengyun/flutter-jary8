import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:jaryapp/routes/application.dart';
import 'package:jaryapp/routes/router_handler.dart';

class Routes {
  static String root = '/';

  static String search = '/search';

  static String articleDetail = '/article-detail';

  static String about = '/about';
  static String version = '/version';

  static String resume = '/resume';
  static String evaluation = '/evaluation';

  static String login = '/login';

  static String otherView = '/other-view';

  static void configureRoutes(FluroRouter router) {
    router.define(root, handler: indexHandler);
    router.define(search, handler: searchHandler);
    router.define(articleDetail, handler: articleDetailHandler);
    router.define(about, handler: aboutHandler);
    router.define(version, handler: versionHandler);
    router.define(resume, handler: resumeHandler);
    router.define(evaluation, handler: evaluationHandler);
    router.define(login, handler: loginHandler);
    router.define(otherView, handler: otherViewHandler);
  }

  /// 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(BuildContext context, String path, {
    Map<String, dynamic> params,
    String transition = 'cupertino',
    bool replace = false,
    bool clearStack = false,
    Duration transitionDuration = const Duration(milliseconds: 250),
    RouteTransitionsBuilder transitionBuilder
  }) {
    String query = '';
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        if (params[key] != null) {
          var value = Uri.encodeComponent(params[key]);
          if (index == 0) {
            query = '?';
          } else {
            query = query + '\&';
          }
          query += '$key=$value';
          index++;
        }
      }
    }

    /// 字符串转enum
    TransitionType _transitionType = TransitionType.values.firstWhere((e) => e.toString() == 'TransitionType.$transition');

    path = path + query;
    return Application.router.navigateTo(context, path,
      transition: _transitionType,
      replace: replace,
      clearStack: clearStack,
      transitionBuilder: transitionBuilder,
      transitionDuration: transitionDuration
    );
  }
}
