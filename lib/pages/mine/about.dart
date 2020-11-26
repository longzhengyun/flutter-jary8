import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:jaryapp/routes/routes.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/widget/common/app_header.dart';
import 'package:jaryapp/widget/common/link_item.dart';
import 'package:jaryapp/widget/common/table_item.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  List _tableList = [
    { 'text': '应用技术', 'value': 'HTML5、CSS3、VUE、NODE、SQLITE等' },
    { 'text': '版权声明', 'value': '网站版权归佳瑞网所有，文章归原作者所有。' },
    { 'text': '网站说明', 'value': '佳瑞网属于个人博客类网站，为记录及分享前端开发相关文章而建。' },
  ];

  List _linkList = [
    { 'text': '版本', 'value': 'V 4.0.1', 'route': Routes.version }
  ];

  void _onLinkTap(Map data) {
    Routes.navigateTo(context, data['route']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: '关于佳瑞网'),
      body: EasyRefresh.custom(
        slivers: <Widget>[
          SliverFixedExtentList(
            itemExtent: 46 * Global.pr,
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return LinkItem(_linkList[index], index, _onLinkTap);
            }, childCount: _linkList.length),
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Container(
                height: 10 * Global.pr,
              ),
            ])
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return TableItem(_tableList[index], index, isMulti: true);
            }, childCount: _tableList.length)
          ),
        ],
      )
    );
  }
}