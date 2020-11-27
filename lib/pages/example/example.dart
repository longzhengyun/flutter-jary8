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
import 'package:jaryapp/widget/example/example_item.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int _tabIndex = 0;
  List _tabConfig = [
    { 'text': '全部', 'index': 0, 'category': '' },
    { 'text': 'Mobile', 'index': 1, 'category': 'Mobile' },
    { 'text': 'PC', 'index': 2, 'category': 'PC' },
  ];

  String _exampleCategory = '';
  int _exampleIndex = 1;
  List _exampleList = [];

  @override
  void initState() {
    super.initState();

    _getExampleList(1, _exampleCategory); /// 获取案例数据
  }

  /// 获取案例数据
  void _getExampleList(int index, String category) async {
    try {
      List _result = await ApiFetch.apiFetch(ApiConfig.EXAMPLE_LIST, params: { 'index': index, 'category': category });

      int _index = _exampleIndex;
      List _list = _exampleList;
      if (_result.isNotEmpty) {
        if (index == 1) {
          _list = _result;
        } else {
          _list.addAll(_result);
        }

        _index = index + 10;
      }

      setState(() {
        _exampleCategory = category;
        _exampleIndex = _index;
        _exampleList = _list;
      });
    } catch (e) {
    }
  }

  void _onTabTap(Map data) {
    _getExampleList(1, data['category']);

    setState(() {
      _tabIndex = data['index'];
    });
  }

  void _onItemTap(Map data) {
    Routes.navigateTo(context, Routes.exampleDetail, params: { 'id': data['id'].toString() });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: '个人案例'),
      body: Column(
        children: <Widget>[
          AppTab(_tabConfig, _tabIndex, _onTabTap),
          Expanded(
            child: EasyRefresh.custom(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                    _exampleList.isEmpty ? Nothing() : Container(
                      height: 10 * Global.pr
                    )
                  ]),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    return ExampleItem(_exampleList[index], _onItemTap);
                  }, childCount: _exampleList.length)
                ),
              ],
              header: MaterialHeader(
                valueColor: AlwaysStoppedAnimation(Color(ThemeConfig.loadingColor)),
              ),
              onRefresh: () async {
                _getExampleList(1, _exampleCategory);
              },
              footer: MaterialFooter(
                valueColor: AlwaysStoppedAnimation(Color(ThemeConfig.loadingColor)),
                enableInfiniteLoad: false, /// 关闭无限加载模式
              ),
              onLoad: () async {
                _getExampleList(_exampleIndex, _exampleCategory);
              },
            )
          )
        ]
      )
    );
  }
}