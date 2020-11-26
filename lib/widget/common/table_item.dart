import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class TableItem extends StatelessWidget {
  TableItem(this.data, this.index, { Key key, this.isMulti = false }) : super(key: key);

  final Map data;
  final int index;
  final bool isMulti;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(ThemeConfig.defaultBgColor),
      padding: EdgeInsets.only(left: 20 * Global.pr, right: 20 * Global.pr),
      child: Container(
        padding: EdgeInsets.only(top: 10 * Global.pr, bottom: 10 * Global.pr),
        decoration: index != 0 ? BoxDecoration(
          border: Border(top: BorderSide(color: Color(ThemeConfig.defaultBorderColor), width: 0.5)),
        ) : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: <Widget>[
            Container(
              width: 80 * Global.pr,
              child: Text(data['text'], style: TextStyle(
                fontSize: 16 * Global.pr,
                color: Color(ThemeConfig.tableTextColor),
              )),
            ),
            Expanded(
              child: Text(data['value'], textAlign: isMulti ? TextAlign.left : TextAlign.right, style: TextStyle(
                fontSize: 16 * Global.pr,
                color: Color(ThemeConfig.defaultTextColor),
              )),
            ),
          ]
        ),
      )
    );
  }
}