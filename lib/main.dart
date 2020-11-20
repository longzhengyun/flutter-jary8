import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluro/fluro.dart';
import 'package:jaryapp/api/index.dart';
import 'package:jaryapp/routes/application.dart';
import 'package:jaryapp/routes/routes.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  runApp(MyApp());

  if (Platform.isAndroid) {
    /// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatefulWidget {
  @override
  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    ApiFetch.init();
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      dismissOtherOnShow: true, /// 全局设置隐藏之前的toast
      child: MaterialApp(
        initialRoute: '/', /// 配置默认访问路径
        theme: ThemeData(scaffoldBackgroundColor: Color(ThemeConfig.defaultPageBgColor)),
        onGenerateRoute: Application.router.generator,
        // debugShowMaterialGrid: true, // 显示网格
      ),
    );
  }
}
