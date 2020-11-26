import 'package:flutter/material.dart';
import 'package:jaryapp/pages/article/article.dart';
import 'package:jaryapp/pages/home/home.dart';
import 'package:jaryapp/pages/mine/mine.dart';
import 'package:jaryapp/pages/site/site.dart';
import 'package:jaryapp/utils/event_bus.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/widget/common/app_menu.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  /// 菜单
  List _menuData = [Icons.home, Icons.library_books, Icons.web, Icons.person];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
      bottomNavigationBar: AppMenu(_menuData, _currentIndex, _onMenuTap),
    );
  }
}
