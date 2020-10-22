import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jarywebsite/utils/event_bus.dart';
import 'package:flutter/services.dart';
import 'package:jarywebsite/api/config.dart';
import 'package:jarywebsite/styles/theme_config.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  ApiPost(); /// 初始化api方法

  runApp(MyApp());

  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatefulWidget {
  @override
  createState() => _MyAppState();

  static BuildContext getContext() {
    return _MyAppState.getContext();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  static BuildContext appContext;

  static BuildContext getContext() {
    return appContext;
  }

  @override
  void initState() {
    super.initState();

    /// 监听登录状态通知
    EventBus.instance.addListener(EventKeys.LoginState, (arg) {});
  }

  @override
  void dispose() {
    super.dispose();

    EventBus.instance.removeListener(EventKeys.LoginState); /// 移除登录状态通知监听
  }

  @override
  Widget build(BuildContext context) {
    appContext = context;
    // final router = Router();
    // Routes.configureRoutes(router);
    // AppRouter.router = router;

    return OKToast(
      dismissOtherOnShow: true, /// 全局设置隐藏之前的toast
      child: MaterialApp(
        initialRoute: '/', /// 配置默认访问路径
        theme: ThemeData(scaffoldBackgroundColor: Color(ThemeConfig.defaultBgColor)),
        // onGenerateRoute: AppRouter.router.generator,
        // debugShowMaterialGrid: true, // 显示网格
      ),
    );
  }
}
