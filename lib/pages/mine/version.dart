import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:jaryapp/widget/common/app_header.dart';
import 'package:jaryapp/widget/common/table_item.dart';

class Version extends StatefulWidget {
  @override
  _VersionState createState() => _VersionState();
}

class _VersionState extends State<Version> {
  List _tableList = [
    { 'text': '2020.6', 'value': '佳瑞网V4.0上线。使用技术包括：HTML5、CSS3、VueJS、NodeJS、SQLITE等。新版佳瑞网放弃兼容PC端，以纯webApp模式，使用基于VueJS的Nuxt框架构建。' },
    { 'text': '2018', 'value': '使用Vue框架升级网站，重新设计整个网站的架构。' },
    { 'text': '2017.6', 'value': '佳瑞网APP V1.0 Android版发布。使用技术包括：React Native、JavaScript等。' },
    { 'text': '2016.8', 'value': '佳瑞网V3.0上线。使用技术包括：HTML5、CSS3、AngularJS、JavaScript、PHP等。新版采用移动端优先，PC端兼容的模式，以AngularJS为基础，更新了整个网站。' },
    { 'text': '2015', 'value': '为了应用新的技术，再次升级佳瑞网的计划也提上日程。' },
    { 'text': '', 'value': '网站内容完善中' },
    { 'text': '2012.4', 'value': '佳瑞网V2.0上线。启用新域名：jary8.com。使用技术包括：HTML5、CSS3、JQuery、JavaScript、PHP(EMLOG博客模板)等。新版放弃Flash，以PHP+MYSQL为基础，全新设计制作整个网站，使佳瑞网拥有了后台管理系统，成为真正的博客网站。' },
    { 'text': '2011', 'value': '由于技术更新换代，新版佳瑞网在业余时间，持续不断的制作中。' },
    { 'text': '', 'value': '网站内容完善中' },
    { 'text': '2008.4', 'value': '佳瑞网V1.0上线。域名为：jary9.cn。使用技术包括：HTML、CSS、Flash等。网站功能简单，主要用FLASH技术实现页面切换及在线留言功能。' },
    { 'text': '2008', 'value': '创建佳瑞网的构想酝酿中，并迅速执行实现。' },
    { 'text': '2007', 'value': '前端初入行，梦想有一个自己的网站！' },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: '大事记'),
      body: EasyRefresh.custom(
        slivers: <Widget>[
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