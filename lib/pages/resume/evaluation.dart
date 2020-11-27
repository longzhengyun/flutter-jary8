import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:jaryapp/api/config.dart';
import 'package:jaryapp/api/index.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:jaryapp/widget/common/app_header.dart';
import 'package:jaryapp/widget/resume/resume_item.dart';

class Evaluation extends StatefulWidget {
  @override
  _EvaluationState createState() => _EvaluationState();
}

class _EvaluationState extends State<Evaluation> {
  List _detailList = [];

  @override
  void initState() {
    super.initState();

    _getUserDetail();
  }

  /// 获取用户详细信息数据
  void _getUserDetail() async {
    try {
      Map _result = await ApiFetch.apiFetch(ApiConfig.USER_DETAIL, params: { 'category': 'evaluation' });

      List _list = json.decode(_result['info']);

      setState(() {
        _detailList = _list;
      });
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: '职业评价'),
      body: EasyRefresh.custom(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return ResumeItem(_detailList[index]);
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