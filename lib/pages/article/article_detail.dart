import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:jaryapp/api/config.dart';
import 'package:jaryapp/api/index.dart';
import 'package:jaryapp/routes/routes.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:jaryapp/widget/article/detail_content.dart';
import 'package:jaryapp/widget/article/detail_info.dart';
import 'package:jaryapp/widget/common/app_header.dart';
import 'package:jaryapp/widget/common/hot_list.dart';

class ArticleDetail extends StatefulWidget {
  ArticleDetail(this.id, { Key key }) : super(key: key);

  final String id;

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  Map _articleInfo;
  String _articleContent;

  List _articleRecommend = [];

  @override
  void initState() {
    super.initState();

    _getArticDetail(); /// 获取文章详情数据
  }

  /// 获取文章详情数据
  void _getArticDetail() async {
    try {
      int _id = int.parse(widget.id);
      Map _result = await ApiFetch.apiFetch(ApiConfig.ARTICLE_DETAIL, params: { 'id': _id });
      Map _data = _result['data'];

      Map _info = {
        'title': _data['title'],
        'category': _data['category'],
        'date': Global.formatDate(_data['date'] * 1000),
      };

      String _content = _data['content'].replaceAll('="/content/uploadfile/', '="${Global.getStaticPath()}/content/uploadfile/');

      _getArticRecommend(_id, _data['category']); /// 获取推荐文章数据

      setState(() {
        _articleInfo = _info;
        _articleContent = _content;
      });
    } catch (e) {
    }
  }

  /// 获取推荐文章数据
  void _getArticRecommend(id, category) async {
    try {
      Map _result = await ApiFetch.apiFetch(ApiConfig.ARTICLE_RECOMMEND, params: { 'id': id, 'category': category });

      setState(() {
        _articleRecommend = _result['data'];
      });
    } catch (e) {
    }
  }

  void _onContentTap(String url) {
    Routes.navigateTo(context, Routes.otherView, params: { 'url': url });
  }

  void _onRecommendTap(String key, { Map data }) {
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
              DetailInfo(_articleInfo),
              DetailContent(_articleContent, _onContentTap),
              HotList('推荐文章', _articleRecommend, _onRecommendTap),
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