import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class TableItem extends StatelessWidget {
  TableItem(this.data, this.index, { Key key }) : super(key: key);

  final Map data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              color: Color(ThemeConfig.tableTextColor),
            )),
            Text(data['value'], style: TextStyle(
              fontSize: 16 * Global.pr,
              height: 1,
              color: Color(ThemeConfig.defaultTextColor),
            )),
          ]
        ),
      )
    );
  }
}