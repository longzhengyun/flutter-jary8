import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class DetailInfo extends StatelessWidget {
  DetailInfo(this.data, { Key key }) : super(key: key);

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
                color: Color(ThemeConfig.detailInfoTextColor),
              )),
              Text('日期：${data['date']}', style: TextStyle(
                fontSize: 12 * Global.pr,
                color: Color(ThemeConfig.detailInfoTextColor),
              )),
            ]
          ),
        ]
      ),
    ) : Container();
  }
}