import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class LinkItem extends StatelessWidget {
  LinkItem(this.data, this.index, this.callback, { Key key }) : super(key: key);

  final Map data;
  final int index;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
      onTap: () => callback(data),
      child: Container(
        color: Color(ThemeConfig.defaultBgColor),
        padding: EdgeInsets.only(left: 20 * Global.pr, right: 20 * Global.pr),
        child: Container(
          decoration: index != 0 ? BoxDecoration(
            border: Border(top: BorderSide(color: Color(ThemeConfig.defaultBorderColor), width: 0.5)),
          ) : null,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(data['text'], style: TextStyle(
                fontSize: 16 * Global.pr,
                height: 1,
                color: Color(ThemeConfig.defaultTextColor),
              )),
              Icon(Icons.arrow_forward_ios, color: Color(ThemeConfig.linkTextColor), size: 20 * Global.pr),
            ]
          ),
        )
      )
    );
  }
}