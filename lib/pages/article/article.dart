import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:jaryapp/api/config.dart';
import 'package:jaryapp/api/index.dart';
import 'package:jaryapp/routes/routes.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:jaryapp/widget/article/article_item.dart';
import 'package:jaryapp/widget/common/app_header.dart';
import 'package:jaryapp/widget/common/app_tab.dart';
import 'package:jaryapp/widget/common/nothing.dart';

class Article extends StatefulWidget {
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  int _tabIndex = 0;
  List _tabConfig = [
    { 'text': '全部', 'index': 0, 'category': '' },
    { 'text': 'HTML', 'index': 1, 'category': 'HTML' },
    { 'text': 'CSS', 'index': 2, 'category': 'CSS' },
    { 'text': 'JavaScript', 'index': 3, 'category': 'JavaScript' },
    { 'text': '杂谈', 'index': 4, 'category': '杂谈' },
  ];

  String _articleCategory = '';
  int _articleIndex = 1;
  List _articleList = [];

  @override
  void initState() {
    super.initState();

    _getArticleList(1, _articleCategory); /// 获取文章数据
  }

  /// 获取文章数据
  void _getArticleList(int index, String category) async {
    try {
      List _result = await ApiFetch.apiFetch(ApiConfig.ARTICLE_LIST, params: { 'index': index, 'category': category });

      int _index = _articleIndex;
      List _list = _articleList;
      if (_result.isNotEmpty) {
        if (index == 1) {
          _list = _result;
        } else {
          _list.addAll(_result);
        }

        _index = index + 10;
      }

      setState(() {
        _articleCategory = category;
        _articleIndex = _index;
        _articleList = _list;
      });
    } catch (e) {
    }
  }

  void _onTabTap(Map data) {
    _getArticleList(1, data['category']);

    setState(() {
      _tabIndex = data['index'];
    });
  }

  void _onItemTap(Map data) {
    Routes.navigateTo(context, Routes.articleDetail, params: { 'id': data['id'].toString() });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: '前端文章', hideBack: true),
      body: Column(
        children: <Widget>[
          AppTab(_tabConfig, _tabIndex, _onTabTap),
          Expanded(
            child: EasyRefresh.custom(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                    _articleList.isEmpty ? Nothing() : Container(
                      height: 10 * Global.pr
                    )
                  ]),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    return ArticleItem(_articleList[index], _onItemTap);
                  }, childCount: _articleList.length)
                ),
              ],
              header: MaterialHeader(
                valueColor: AlwaysStoppedAnimation(Color(ThemeConfig.loadingColor)),
              ),
              onRefresh: () async {
                _getArticleList(1, _articleCategory);
              },
              footer: MaterialFooter(
                valueColor: AlwaysStoppedAnimation(Color(ThemeConfig.loadingColor)),
                enableInfiniteLoad: false, /// 关闭无限加载模式
              ),
              onLoad: () async {
                _getArticleList(_articleIndex, _articleCategory);
              },
            )
          )
        ]
      )
    );
  }
}