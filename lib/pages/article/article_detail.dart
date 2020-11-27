import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:jaryapp/api/config.dart';
import 'package:jaryapp/api/index.dart';
import 'package:jaryapp/routes/routes.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:jaryapp/widget/article/article_detail_content.dart';
import 'package:jaryapp/widget/article/article_detail_info.dart';
import 'package:jaryapp/widget/common/app_header.dart';
import 'package:jaryapp/widget/common/hot_list.dart';
import 'package:jaryapp/widget/common/image_dialog.dart';

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

    _getArticleDetail(); /// 获取文章详情数据
  }

  /// 获取文章详情数据
  void _getArticleDetail() async {
    try {
      int _id = int.parse(widget.id);
      Map _result = await ApiFetch.apiFetch(ApiConfig.ARTICLE_DETAIL, params: { 'id': _id });

      Map _info = {
        'title': _result['title'],
        'category': _result['category'],
        'date': Global.formatDate(_result['date'] * 1000),
      };

      String _content = _result['content'].replaceAll('="/content/uploadfile/', '="${Global.getStaticPath()}/content/uploadfile/');

      _getArticleRecommend(_id, _result['category']); /// 获取推荐文章数据

      setState(() {
        _articleInfo = _info;
        _articleContent = _content;
      });
    } catch (e) {
    }
  }

  /// 文章内容点击
  void _onContentTap(String url) {
    if (url.endsWith('.png') || url.endsWith('.jpg') || url.endsWith('.gif')) { /// 预览图片
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return ImageDialog({ 'url': url });
        }
      );
    } else {
      Routes.navigateTo(context, Routes.otherView, params: { 'url': url }); /// 跳转网址
    }
  }

  /// 获取推荐文章数据
  void _getArticleRecommend(int id, String category) async {
    try {
      List _result = await ApiFetch.apiFetch(ApiConfig.ARTICLE_RECOMMEND, params: { 'id': id, 'category': category });

      setState(() {
        _articleRecommend = _result;
      });
    } catch (e) {
    }
  }

  void _onRecommendTap(String key, { Map data }) {
    if (key == 'Item') {
      Routes.navigateTo(context, Routes.articleDetail, params: { 'id': data['id'].toString() }, replace: true);
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
              ArticleDetailInfo(_articleInfo),
              ArticleDetailContent(_articleContent, _onContentTap),
              HotList('推荐文章', _articleRecommend, _onRecommendTap),
            ])
          ),
        ],
        header: MaterialHeader(
          valueColor: AlwaysStoppedAnimation(Color(ThemeConfig.loadingColor)),
        ),
        onRefresh: () async {
          _getArticleDetail(); /// 获取文章详情数据
        }
      )
    );
  }
}