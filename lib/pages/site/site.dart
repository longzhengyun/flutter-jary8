import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:jaryapp/api/config.dart';
import 'package:jaryapp/api/index.dart';
import 'package:jaryapp/routes/routes.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:jaryapp/widget/common/app_header.dart';
import 'package:jaryapp/widget/common/app_tab.dart';
import 'package:jaryapp/widget/common/nothing.dart';
import 'package:jaryapp/widget/site/site_item.dart';

class Site extends StatefulWidget {
  @override
  _SiteState createState() => _SiteState();
}

class _SiteState extends State<Site> {
  int _tabIndex = 0;
  List _tabConfig = [
    { 'text': '全部', 'index': 0, 'category': '' },
    { 'text': '技术', 'index': 1, 'category': '技术' },
    { 'text': '工具', 'index': 2, 'category': '工具' },
    { 'text': '其他', 'index': 3, 'category': '其他' },
  ];

  String _siteCategory = '';
  int _siteIndex = 1;
  List _siteList = [];

  @override
  void initState() {
    super.initState();

    _getSiteList(1, _siteCategory); /// 获取网站数据
  }

  /// 获取网站数据
  void _getSiteList(int index, String category) async {
    try {
      List _result = await ApiFetch.apiFetch(ApiConfig.SITE_LIST, params: { 'index': index, 'category': category });

      int _index = _siteIndex;
      List _list = _siteList;
      if (_result.isNotEmpty) {
        if (index == 1) {
          _list = _result;
        } else {
          _list.addAll(_result);
        }

        _index = index + 10;
      }

      setState(() {
        _siteCategory = category;
        _siteIndex = _index;
        _siteList = _list;
      });
    } catch (e) {
    }
  }

  void _onTabTap(Map data) {
    _getSiteList(1, data['category']);

    setState(() {
      _tabIndex = data['index'];
    });
  }

  void _onItemTap(Map data) {
    Routes.navigateTo(context, Routes.otherView, params: { 'url': data['url'], 'title': data['title'] });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: '推荐网站', hideBack: true),
      body: Column(
        children: <Widget>[
          AppTab(_tabConfig, _tabIndex, _onTabTap),
          Expanded(
            child: EasyRefresh.custom(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                    _siteList.isEmpty ? Nothing() : Container(
                      height: 10 * Global.pr
                    )
                  ]),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    return SiteItem(_siteList[index], _onItemTap);
                  }, childCount: _siteList.length)
                ),
              ],
              header: MaterialHeader(
                valueColor: AlwaysStoppedAnimation(Color(ThemeConfig.loadingColor)),
              ),
              onRefresh: () async {
                _getSiteList(1, _siteCategory);
              },
              footer: MaterialFooter(
                valueColor: AlwaysStoppedAnimation(Color(ThemeConfig.loadingColor)),
                enableInfiniteLoad: false, /// 关闭无限加载模式
              ),
              onLoad: () async {
                _getSiteList(_siteIndex, _siteCategory);
              },
            )
          )
        ]
      )
    );
  }
}