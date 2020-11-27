import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:jaryapp/api/config.dart';
import 'package:jaryapp/api/index.dart';
import 'package:jaryapp/routes/routes.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:jaryapp/widget/common/app_header.dart';
import 'package:jaryapp/widget/common/hot_list.dart';
import 'package:jaryapp/widget/example/example_detail_info.dart';
import 'package:oktoast/oktoast.dart';

class ExampleDetail extends StatefulWidget {
  ExampleDetail(this.id, { Key key }) : super(key: key);

  final String id;

  @override
  _ExampleDetailState createState() => _ExampleDetailState();
}

class _ExampleDetailState extends State<ExampleDetail> {
  Map _exampleInfo;

  List _examplePages = [];

  List _exampleRecommend = [];

  @override
  void initState() {
    super.initState();

    _getExampleDetail(); /// 获取案例详情数据
  }

  /// 获取案例详情数据
  void _getExampleDetail() async {
    try {
      Map _result = await ApiFetch.apiFetch(ApiConfig.EXAMPLE_DETAIL, params: { 'id': widget.id });

      Map _info = {
        'title': _result['title'],
        'category': _result['category'],
        'belong': _result['belong'],
        'date': _result['date'],
        'description': _result['description'],
      };

      String _pagesString = _result['pages'].replaceAll('"url":"', '"url":"${Global.getStaticPath()}/example/');
      List _pages = json.decode(_pagesString);
      for (var item in _pages) {
        item['title'] = item['name'];
      }

      _getExampleRecommend(widget.id, _result['belong']); /// 获取相关案例数据

      setState(() {
        _exampleInfo = _info;
        _examplePages = _pages;
      });
    } catch (e) {
    }
  }

  /// 获取相关案例数据
  void _getExampleRecommend(String id, String belong) async {
    try {
      List _result = await ApiFetch.apiFetch(ApiConfig.EXAMPLE_RECOMMEND, params: { 'id': id, 'belong': belong });

      setState(() {
        _exampleRecommend = _result;
      });
    } catch (e) {
    }
  }

  void _onPagesTap(String key, { Map data }) {
    if (key == 'Item') {
      if (data['url'].endsWith('.html')) {
        Routes.navigateTo(context, Routes.otherView, params: { 'url': data['url'], 'title': data['title'] });
      } else {
        showToast('该页面为后端html模板，暂不支持预览');
      }
    }
  }

  void _onRecommendTap(String key, { Map data }) {
    if (key == 'Item') {
      Routes.navigateTo(context, Routes.exampleDetail, params: { 'id': data['id'].toString() }, replace: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: '案例详情'),
      body: EasyRefresh.custom(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              ExampleDetailInfo(_exampleInfo),
              HotList('Pages', _examplePages, _onPagesTap),
              HotList('相关案例', _exampleRecommend, _onRecommendTap),
            ])
          ),
        ],
        header: MaterialHeader(
          valueColor: AlwaysStoppedAnimation(Color(ThemeConfig.loadingColor)),
        ),
        onRefresh: () async {
          _getExampleDetail(); /// 获取案例详情数据
        }
      )
    );
  }
}