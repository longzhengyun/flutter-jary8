import 'package:flutter/material.dart';
import 'package:jaryapp/api/index.dart';
import 'package:jaryapp/api/config.dart';
import 'package:jaryapp/manager/user.dart';
import 'package:jaryapp/models/index.dart';
import 'package:jaryapp/pages/article/article.dart';
import 'package:jaryapp/pages/home/home.dart';
import 'package:jaryapp/pages/mine/mine.dart';
import 'package:jaryapp/pages/site/site.dart';
import 'package:jaryapp/utils/event_bus.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:jaryapp/widget/common/app_menu.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  Future<void> _future;

  /// app启动
  bool _isFirst = true;

  /// 菜单
  List _menuData = [
    { 'text': '首页', 'icon': 0xe900 },
    { 'text': '文章', 'icon': 0xe920 },
    { 'text': '网站', 'icon': 0xe92e },
    { 'text': '我的', 'icon': 0xe976 },
  ];

  /// 当前tab
  int _currentIndex = 0;

  /// 底部bar对应的页面
  final List<Widget> _children = [
    Home(),
    Article(),
    Site(),
    Mine(),
  ];

  @override
  void initState() {
    super.initState();

    _future = _checkLogin(); /// 启动App时，判断是否登录

    /// 监听菜单切换通知
    EventBus.instance.addListener(EventKeys.ChangeMenu, (index) {
      _onMenuTap(index); /// 切换菜单
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Global().init(context); /// 导入全局变量
  }

  @override
  void dispose() {
    super.dispose();

    EventBus.instance.removeListener(EventKeys.ChangeMenu); /// 移除菜地切换通知监听
  }

  /// 切换菜单
  void _onMenuTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  /// 获取登录信息
  Future<Map> _checkLogin() async {
    Map _result;

    try {
      _result = await ApiFetch.apiFetch(ApiConfig.USER_CHECK_LOGIN);
    } catch (e) {
    }

    return _result;
  }

  void _saveLoginState(dynamic snapshot) async {
    if (_isFirst) {
      UserManager _userManager = UserManager();
      _userManager.user = snapshot.hasData ? User.fromJson(snapshot.data) : null;

      _isFirst = false; /// 非app启动
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          /// 请求已结束
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              /// 请求失败，显示错误
              return Text('Error: ${snapshot.error}');
            } else {
              _saveLoginState(snapshot); /// 保存登录信息

              /// 请求成功，显示页面
              return IndexedStack(
                index: _currentIndex,
                children: _children,
              );
            }
          } else {
            /// 请求未结束，显示loading
            return Align(
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Color(ThemeConfig.loadingColor)), strokeWidth: 2)
            );
          }
        }
      ),
      bottomNavigationBar: AppMenu(_menuData, _currentIndex, _onMenuTap),
    );
  }
}
