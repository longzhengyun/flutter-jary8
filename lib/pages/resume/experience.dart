import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:jaryapp/api/config.dart';
import 'package:jaryapp/api/index.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:jaryapp/widget/common/app_header.dart';
import 'package:jaryapp/widget/resume/resume_item.dart';

class Experience extends StatefulWidget {
  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  List _detailList = [];

  @override
  void initState() {
    super.initState();

    _getUserDetail();
  }

  /// 获取用户详细信息数据
  void _getUserDetail() async {
    try {
      Map _result = await ApiFetch.apiFetch(ApiConfig.USER_DETAIL, params: { 'category': 'experience' });

      List _list = json.decode(_result['experience']);

      /// 格式化数据
      for (var item in _list) {
        item['list'] = [
          { 'text': '入离时间', 'value': item['time'] },
          { 'text': '所属行业', 'value': item['industry'] },
          { 'text': '企业类型', 'value': item['property'] },
          { 'text': '企业规模', 'value': item['size'] },
          { 'text': '企业介绍', 'value': item['description'] },
          { 'text': '个人职责', 'value': item['duty'] },
        ];
      }

      setState(() {
        _detailList = _list;
      });
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: '工作经历'),
      body: EasyRefresh.custom(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return ResumeItem(_detailList[index], isList: true, isMulti: true);
            }, childCount: _detailList.length),
          )
        ],
        header: MaterialHeader(
          valueColor: AlwaysStoppedAnimation(Color(ThemeConfig.loadingColor)),
        ),
        onRefresh: () async {
          _getUserDetail(); /// 获取用户详细信息数据
        }
      )
    );
  }
}