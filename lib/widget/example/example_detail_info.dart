import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class ExampleDetailInfo extends StatelessWidget {
  ExampleDetailInfo(this.data, { Key key }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return data != null ? Container(
      color: Color(ThemeConfig.defaultBgColor),
      padding: EdgeInsets.all(20 * Global.pr),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10 * Global.pr),
            child: Text(data['title'], style: TextStyle(
              fontSize: 18 * Global.pr,
              color: Color(ThemeConfig.defaultTextColor),
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('分类：${data['category']}', style: TextStyle(
                fontSize: 12 * Global.pr,
                color: Color(ThemeConfig.exampleTextColor),
              )),
              Text('所属：${data['belong']}', style: TextStyle(
                fontSize: 12 * Global.pr,
                color: Color(ThemeConfig.exampleTextColor),
              )),
              Text('日期：${data['date']}', style: TextStyle(
                fontSize: 12 * Global.pr,
                color: Color(ThemeConfig.exampleTextColor),
              )),
            ]
          ),
          Container(
            padding: EdgeInsets.only(top: 10 * Global.pr),
            margin: EdgeInsets.only(top: 10 * Global.pr),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Color(ThemeConfig.defaultBorderColor), width: 0.5)),
            ),
            alignment: Alignment.centerLeft,
            child: Text(data['description'], style: TextStyle(
              fontSize: 14 * Global.pr,
              color: Color(ThemeConfig.defaultTextColor),
            )),
          )
        ]
      ),
    ) : Container();
  }
}