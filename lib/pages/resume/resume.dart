import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:jaryapp/api/config.dart';
import 'package:jaryapp/api/index.dart';
import 'package:jaryapp/routes/routes.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:jaryapp/widget/common/app_header.dart';
import 'package:jaryapp/widget/common/link_item.dart';
import 'package:jaryapp/widget/common/table_item.dart';
import 'package:jaryapp/widget/resume/resume_icon.dart';

class Resume extends StatefulWidget {
  @override
  _ResumeState createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  List _baseList = [];

  List _detailList = [];

  List _linkList = [
    { 'text': '个人案例', 'route': Routes.otherView },
    { 'text': '职业评价', 'route': Routes.evaluation },
    { 'text': '职业技能', 'route': Routes.skill },
    { 'text': '工作经历', 'route': Routes.experience },
    { 'text': '其他信息', 'route': Routes.otherInfo },
  ];

  @override
  void initState() {
    super.initState();

    _getUserDetail();
  }

  /// 获取用户详细信息数据
  void _getUserDetail() async {
    try {
      Map _result = await ApiFetch.apiFetch(ApiConfig.USER_DETAIL);

      setState(() {
        _baseList = [
          { 'text': '姓名', 'value': _result['nickname'] },
          { 'text': '年龄', 'value': Global.formatYear(_result['birthday']) },
          { 'text': '手机', 'value': _result['phone'].toString() },
          { 'text': 'Email', 'value': _result['email'] },
          { 'text': 'GitHub', 'value': _result['github'] },
        ];

        _detailList = [
          { 'text': '学历', 'value': _result['degrees'] },
          { 'text': '专业', 'value': _result['major'] },
          { 'text': '职业', 'value': _result['job'] },
          { 'text': '工作年限', 'value': Global.formatYear(_result['worklife']) },
          { 'text': '工作状态', 'value': _result['state'] },
          { 'text': '期望年薪', 'value': _result['salary'].toString() },
        ];
      });
    } catch (e) {
    }
  }

  void _onLinkTap(Map data) {
    Routes.navigateTo(context, data['route']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: 'Resume'),
      body: EasyRefresh.custom(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              ResumeIcon()
            ])
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return TableItem(_baseList[index], index);
            }, childCount: _baseList.length),
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
              return TableItem(_detailList[index], index);
            }, childCount: _detailList.length),
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Container(
                height: 10 * Global.pr,
              ),
            ])
          ),
          SliverFixedExtentList(
            itemExtent: 46 * Global.pr,
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return LinkItem(_linkList[index], index, _onLinkTap);
            }, childCount: _linkList.length),
          ),
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