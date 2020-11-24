import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class SearchTitle extends StatelessWidget {
  SearchTitle(this.text, this.callback, { Key key }) : super(key: key);

  final String text;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(ThemeConfig.defaultBorderColor), width: 0.5)),
        color: Color(ThemeConfig.defaultBgColor)
      ),
      margin: EdgeInsets.only(top: 10 * Global.pr),
      padding: EdgeInsets.only(left: 20 * Global.pr, right: 20 * Global.pr, top: 10 * Global.pr, bottom: 10 * Global.pr),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(text, style: TextStyle(
              fontSize: 16 * Global.pr,
              color: Color(ThemeConfig.defaultTextColor),
              height: 1,
            )),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
            onTap: () => callback(),
            child: Container(
              padding: EdgeInsets.only(left: 10 * Global.pr, right: 10 * Global.pr),
              child: Icon(Icons.delete, color: Color(ThemeConfig.defaultTextColor), size: 16 * Global.pr),
            ),
          )
        ]
      )
    );
  }
}