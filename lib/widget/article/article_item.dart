import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class ArticleItem extends StatelessWidget {
  ArticleItem(this.data, this.callback, { Key key }) : super(key: key);

  final Map data;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
      onTap: () => callback(data),
      child: Container(
        height: 40 * Global.pr,
        padding: EdgeInsets.only(left: 20 * Global.pr, right: 20 * Global.pr),
        color: Color(ThemeConfig.defaultBgColor),
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Color(ThemeConfig.defaultBorderColor), width: 0.5),
              bottom: BorderSide(color: Color(ThemeConfig.defaultBorderColor), width: 0.5),
            ),
          ),
          child: Text(data['title'],
            style: TextStyle(
              fontSize: 14 * Global.pr,
              height: 1,
              color: Color(ThemeConfig.defaultTextColor),
            )
          )
        ),
      )
    );
  }
}