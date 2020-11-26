import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class SearchItem extends StatelessWidget {
  SearchItem(this.data, this.index, this.callback, { Key key }) : super(key: key);

  final Map data;
  final int index;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
      onTap: () => callback(data),
      child: Container(
        padding: EdgeInsets.only(left: 20 * Global.pr, right: 20 * Global.pr),
        color: Color(ThemeConfig.defaultBgColor),
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: index != 0 ? BoxDecoration(
            border: Border(top: BorderSide(color: Color(ThemeConfig.defaultBorderColor), width: 0.5)),
          ) : null,
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