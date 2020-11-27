import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class ExampleItem extends StatelessWidget {
  ExampleItem(this.data, this.callback, { Key key }) : super(key: key);

  final Map data;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
      onTap: () => callback(data),
      child: Container(
        margin: EdgeInsets.only(bottom: 10 * Global.pr),
        padding: EdgeInsets.only(left: 20 * Global.pr, right: 20 * Global.pr, top: 10 * Global.pr, bottom: 10 * Global.pr),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(ThemeConfig.defaultBorderColor), width: 0.5),
            bottom: BorderSide(color: Color(ThemeConfig.defaultBorderColor), width: 0.5),
          ),
          color: Color(ThemeConfig.defaultBgColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 5 * Global.pr),
              child: Text(data['title'],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18 * Global.pr,
                  color: Color(ThemeConfig.defaultTextColor),
                )
              ),
            ),
            Container(
              child: Text(data['description'],
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                  fontSize: 14 * Global.pr,
                  color: Color(ThemeConfig.exampleTextColor),
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10 * Global.pr),
              child: Row(
                children: <Widget>[
                  Text(data['date'],
                    style: TextStyle(
                      fontSize: 12 * Global.pr,
                      color: Color(ThemeConfig.exampleTextColor),
                    )
                  ),
                  Container(
                    width: 20 * Global.pr,
                  ),
                  Text(data['category'],
                    style: TextStyle(
                      fontSize: 12 * Global.pr,
                      color: Color(ThemeConfig.exampleTextColor),
                    )
                  ),
                  Container(
                    width: 20 * Global.pr,
                  ),
                  data['hot'] == 'y' ? Text('HOT',
                    style: TextStyle(
                      fontSize: 12 * Global.pr,
                      color: Color(ThemeConfig.exampleHotTextColor),
                    )
                  ) : Container(),
                ],
              ),
            ),
          ]
        )
      )
    );
  }
}