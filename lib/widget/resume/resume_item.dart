import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:jaryapp/widget/common/table_item.dart';

class ResumeItem extends StatelessWidget {
  ResumeItem(this.data, { Key key, this.isList = false, this.isMulti = false }) : super(key: key);

  final Map data;
  final bool isList;
  final bool isMulti;

  @override
  Widget build(BuildContext context) {
    Widget _content;
    List<Widget> _option = [];

    if (isList) {
      for (var i = 0; i < data['list'].length; i++) {
        _option.add(TableItem(data['list'][i], i, isMulti: isMulti));
      }

      _content = Column(
        children: _option,
      );
    } else {
      _content = Container(
        padding: EdgeInsets.only(left: 20 * Global.pr, right: 20 * Global.pr, top: 10 * Global.pr, bottom: 10 * Global.pr),
        child: Text(data['description'], style: TextStyle(
          fontSize: 14 * Global.pr,
          color: Color(ThemeConfig.resumeTextColor),
        )),
      );
    }

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
          _content
        ]
      )
    );
  }
}