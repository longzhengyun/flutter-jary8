import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class ResumeItem extends StatelessWidget {
  ResumeItem(this.data, { Key key }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(ThemeConfig.defaultBgColor),
      margin: EdgeInsets.only(top: 10 * Global.pr),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20 * Global.pr, right: 20 * Global.pr, top: 10 * Global.pr, bottom: 10 * Global.pr),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(ThemeConfig.defaultBorderColor), width: 0.5)),
            ),
            child: Text(data['title'], style: TextStyle(
              fontSize: 18 * Global.pr,
              color: Color(ThemeConfig.defaultTextColor),
            )),
          ),
          Container(
            padding: EdgeInsets.only(left: 20 * Global.pr, right: 20 * Global.pr, top: 10 * Global.pr, bottom: 10 * Global.pr),
            child: Text(data['description'], style: TextStyle(
              fontSize: 14 * Global.pr,
              color: Color(ThemeConfig.resumeTextColor),
            )),
          )
        ]
      )
    );
  }
}