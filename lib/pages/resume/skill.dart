import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:jaryapp/api/config.dart';
import 'package:jaryapp/api/index.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:jaryapp/widget/common/app_header.dart';
import 'package:jaryapp/widget/resume/resume_item.dart';

class Skill extends StatefulWidget {
  @override
  _SkillState createState() => _SkillState();
}

class _SkillState extends State<Skill> {
  List _detailList = [];

  @override
  void initState() {
    super.initState();

    _getUserDetail();
  }

  /// 获取用户详细信息数据
  void _getUserDetail() async {
    try {
      Map _result = await ApiFetch.apiFetch(ApiConfig.USER_DETAIL, params: { 'category': 'skill' });

      List _list = json.decode(_result['skill']);

      /// 格式化数据
      for (var item1 in _list) {
        for (var item2 in item1['description']) {
          item2['value'] = item2['grade'];
        }

        item1['list'] = item1['description'];
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
      appBar: AppHeader(title: '职业技能'),
      body: EasyRefresh.custom(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return ResumeItem(_detailList[index], isList: true);
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