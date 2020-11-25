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
import 'package:jaryapp/widget/common/nothing.dart';

class Article extends StatefulWidget {
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  int _articleIndex = 1;
  List _articleList = [];

  @override
  void initState() {
    super.initState();

    _getArticList(1); /// 获取文章数据
  }

  /// 获取文章数据
  void _getArticList(int index) async {
    try {
      List _result = await ApiFetch.apiFetch(ApiConfig.ARTICLE_LIST, params: { 'index': index});

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
        _articleIndex = _index;
        _articleList = _list;
      });
    } catch (e) {
    }
  }

  void _onItemTap(Map data) {
    Routes.navigateTo(context, Routes.articleDetail, params: { 'id': data['id'].toString() });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      appBar: AppHeader(title: '前端文章', hideBack: true),
      body: Column(
        children: <Widget>[
          Expanded(
            child: EasyRefresh.custom(
              slivers: <Widget>[
                _articleList.isNotEmpty ? SliverFixedExtentList(
                  itemExtent: 184 * Global.pr,
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    return ArticleItem(_articleList[index], _onItemTap);
                  }, childCount: _articleList.length),
                ) : SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                    Nothing()
                  ]),
                ),
              ],
              header: MaterialHeader(
                valueColor: AlwaysStoppedAnimation(Color(ThemeConfig.loadingColor)),
              ),
              onRefresh: () async {
                _getArticList(1);
              },
              footer: MaterialFooter(
                valueColor: AlwaysStoppedAnimation(Color(ThemeConfig.loadingColor)),
                enableInfiniteLoad: false, /// 关闭无限加载模式
              ),
              onLoad: () async {
                _getArticList(_articleIndex);
              },
            )
          )
        ]
      )
    );
  }
}