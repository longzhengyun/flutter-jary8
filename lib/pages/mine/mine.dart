import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:jaryapp/api/config.dart';
import 'package:jaryapp/api/index.dart';
import 'package:jaryapp/manager/user.dart';
import 'package:jaryapp/models/index.dart';
import 'package:jaryapp/routes/routes.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:jaryapp/widget/common/app_header.dart';
import 'package:jaryapp/widget/common/link_item.dart';
import 'package:jaryapp/widget/common/table_item.dart';

class Mine extends StatefulWidget {
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  List _tableList = [];

  List _linkList = [];

  @override
  void initState() {
    super.initState();

    _getUserInfo();
    _checkLogin();
  }

  /// 获取登录信息
  void _checkLogin() async {
    Map _result;
    bool _state = false;

    try {
      _result = await ApiFetch.apiFetch(ApiConfig.USER_CHECK_LOGIN);
      _state = true;
    } catch (e) {
    }

    UserManager _userManager = UserManager();
    _userManager.user = _state ? User.fromJson(_result) : null;

    _changeLinkList(_state);
  }

  /// 获取用户信息数据
  void _getUserInfo() async {
    try {
      Map _result = await ApiFetch.apiFetch(ApiConfig.USER_INFO);

      setState(() {
        _tableList = [
          { 'text': '英文名', 'value': _result['nickname'] },
          { 'text': 'Email', 'value': _result['email'] },
          { 'text': '城市', 'value': _result['city'] },
          { 'text': '职业', 'value': _result['job'] },
          { 'text': '签名', 'value': _result['motto'] },
        ];
      });
    } catch (e) {
    }
  }

  void _changeLinkList(bool state) {
    List _list = [];
    _list.addAll([
      { 'text': '关于佳瑞网', 'route': Routes.otherView },
      { 'text': '佳瑞网APP', 'route': Routes.otherView },
    ]);

    if (state) {
      _list.addAll([
        { 'text': '个人简历', 'route': Routes.otherView },
        { 'text': '设置', 'route': Routes.otherView }
      ]);
    } else {
      _list.add({ 'text': '登录', 'route': Routes.otherView });
    }

    setState(() {
      _linkList = _list;
    });
  }

  void _onLinkTap(Map data) {
    Routes.navigateTo(context, data['route']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: '我的', hideBack: true),
      body: EasyRefresh.custom(
        slivers: <Widget>[
          SliverFixedExtentList(
            itemExtent: 46 * Global.pr,
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return TableItem(_tableList[index], index);
            }, childCount: _tableList.length),
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Container(
                height: 10 * Global.pr,
              ),
            ])
          ),
          SliverFixedExtentList(
            itemExtent: 46 * Global.pr,
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return LinkItem(_linkList[index], index, _onLinkTap);
            }, childCount: _linkList.length),
          ),
        ],
        header: MaterialHeader(
          valueColor: AlwaysStoppedAnimation(Color(ThemeConfig.loadingColor)),
        ),
        onRefresh: () async {
          _getUserInfo(); /// 获取用户信息数据
        }
      )
    );
  }
}