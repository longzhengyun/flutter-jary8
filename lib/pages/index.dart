import 'package:flutter/material.dart';
import 'package:jaryapp/pages/article/article.dart';
import 'package:jaryapp/pages/home/home.dart';
import 'package:jaryapp/pages/mine/mine.dart';
import 'package:jaryapp/pages/site/site.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:jaryapp/widget/common/menu.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  Future<void> _future;

  /// 菜单
  List _menuData = ['首页', '文章', '网站', '我的'];

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

    // _future = _getUserInfo(); /// 启动App时，获取用户信息
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Global().init(context); /// 导入全局变量
  }

  void _onMenuTap(index) {
    setState(() {
      _currentIndex = index;
    });
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
              // _saveUserInfo(snapshot); /// 保存信息

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
      bottomNavigationBar: Menu(_menuData, _currentIndex, _onMenuTap),
    );
  }
}