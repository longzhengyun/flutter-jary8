import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:jaryapp/api/config.dart';
import 'package:jaryapp/api/index.dart';
import 'package:jaryapp/routes/routes.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:jaryapp/widget/common/app_header.dart';
import 'package:jaryapp/widget/common/hot_list.dart';

class ArticleDetail extends StatefulWidget {
  ArticleDetail(this.id, { Key key }) : super(key: key);

  final String id;

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  Map _articleDetail;

  List _articleRecommend = [];

  @override
  void initState() {
    super.initState();

    _getArticDetail(); /// 获取文章详情数据
  }

  /// 获取文章详情数据
  void _getArticDetail() async {
    try {
      Map _result;
      int _id = int.parse(widget.id);

      _result = await ApiFetch.apiFetch(ApiConfig.ARTICLE_DETAIL, params: { 'id': _id });

      _getArticRecommend(_id, _result['data']['category']); /// 获取推荐文章数据

      setState(() {
        _articleDetail = _result['data'];
      });
    } catch (e) {
    }
  }

  /// 获取推荐文章数据
  void _getArticRecommend(id, category) async {
    try {
      Map _result;

      _result = await ApiFetch.apiFetch(ApiConfig.ARTICLE_RECOMMEND, params: { 'id': id, 'category': category });

      setState(() {
        _articleRecommend = _result['data'];
      });
    } catch (e) {
    }
  }

  void _onArticleTap(String key, { Map data }) {
    if (key == 'Item') {
      Routes.navigateTo(context, Routes.articleDetail, params: { 'id': data['id'].toString() });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: '文章详情'),
      body: EasyRefresh.custom(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              HotList('推荐文章', _articleRecommend, _onArticleTap),
            ])
          ),
        ],
        header: MaterialHeader(
          valueColor: AlwaysStoppedAnimation(Color(ThemeConfig.loadingColor)),
        ),
        onRefresh: () async {
          _getArticDetail(); /// 获取文章详情数据
        }
      )
    );
  }
}