import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class HomeList extends StatelessWidget {
  HomeList(this.title, this.list, this.callback, { Key key }) : super(key: key);

  final String title;
  final List list;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    List<Widget> _list = [];
    for (var i = 0; i < list.length; i++) {
      _list.add(GestureDetector(
        behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
        onTap: () => callback('Item', data: list[i]),
        child: Container(
          width: 176 * Global.pr,
          padding: EdgeInsets.only(left: 10 * Global.pr, right: 10 * Global.pr),
          margin: EdgeInsets.only(top: 5 * Global.pr, bottom: 5 * Global.pr),
          decoration: i.isEven ? BoxDecoration(
            border: Border(right: BorderSide(color: Color(ThemeConfig.defaultBorderColor), width: 0.5)),
          ) : null,
          child: Text(list[i]['title'], overflow: TextOverflow.ellipsis, style: TextStyle(
            fontSize: 16 * Global.pr,
            color: Color(ThemeConfig.defaultTextColor),
          )),
        ),
      ));
    }

    return Container(
      color: Color(ThemeConfig.defaultBgColor),
      margin: EdgeInsets.only(top: 10 * Global.pr),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20 * Global.pr, right: 20 * Global.pr, top: 10 * Global.pr, bottom: 10 * Global.pr),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(ThemeConfig.defaultBorderColor), width: 0.5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(title, style: TextStyle(
                  fontSize: 20 * Global.pr,
                  color: Color(ThemeConfig.defaultTextColor),
                )),
                GestureDetector(
                  behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
                  onTap: () => callback('More'),
                  child: Text('MORE', style: TextStyle(
                    fontSize: 16 * Global.pr,
                    color: Color(ThemeConfig.homeListBtnColor),
                  )),
                ),
              ]
            )
          ),
          Container(
            padding: EdgeInsets.all(10 * Global.pr),
            child: Wrap(
              children: _list,
            )
          ),
        ]
      ),
    );
  }
}