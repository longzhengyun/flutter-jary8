import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:jaryapp/api/config.dart';
import 'package:jaryapp/api/index.dart';
import 'package:jaryapp/routes/routes.dart';
import 'package:jaryapp/utils/event_bus.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:jaryapp/widget/common/app_header.dart';
import 'package:jaryapp/widget/common/hot_list.dart';
import 'package:jaryapp/widget/home/logo.dart';
import 'package:jaryapp/widget/home/search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _articleHot = [];

  List _siteHot = [];

  @override
  void initState() {
    super.initState();

    _getArticHot(); /// 获取首页热门文章数据
    _getSiteHot(); /// 获取首页热门网站数据
  }

  /// 获取首页热门文章数据
  void _getArticHot() async {
    try {
      Map _result;

      _result = await ApiFetch.apiFetch(ApiConfig.ARTICLE_HOT);

      setState(() {
        _articleHot = _result['data'];
      });
    } catch (e) {
    }
  }

  /// 获取首页热门网站数据
  void _getSiteHot() async {
    try {
      Map _result;

      _result = await ApiFetch.apiFetch(ApiConfig.SITE_HOT);

      setState(() {
        _siteHot = _result['data'];
      });
    } catch (e) {
    }
  }

  void _onSearchTap() {
    Routes.navigateTo(context, Routes.search);
  }

  void _onArticleTap(String key, { Map data }) {
    if (key == 'More') {
      EventBus.instance.commit(EventKeys.ChangeMenu, 1); /// 通知切换菜单
    }

    if (key == 'Item') {
      Routes.navigateTo(context, Routes.articleDetail, params: { 'id': data['id'].toString() });
    }
  }

  void _onSiteTap(String key, { Map data }) {
    if (key == 'More') {
      EventBus.instance.commit(EventKeys.ChangeMenu, 2); /// 通知切换菜单
    }

    if (key == 'Item') {
      Routes.navigateTo(context, Routes.otherView, params: { 'url': data['url'], 'title': data['title'] });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      appBar: AppHeader(hideBack: true),
      body: EasyRefresh.custom(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              HomeLogo(),
              HomeSearch(_onSearchTap),
              HotList('热门文章', _articleHot, _onArticleTap, showMore: true),
              HotList('热门网站', _siteHot, _onSiteTap, showMore: true),
            ])
          ),
        ],
        header: MaterialHeader(
          valueColor: AlwaysStoppedAnimation(Color(ThemeConfig.loadingColor)),
        ),
        onRefresh: () async {
          _getArticHot(); /// 获取首页热门文章数据
          _getSiteHot(); /// 获取首页热门网站数据
        }
      )
    );
  }
}