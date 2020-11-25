import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class AppTab extends StatelessWidget {
  AppTab(this.data, this.index, this.callback, { Key key }) : super(key: key);

  final List data;
  final int index;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    List<Widget> _option = [];

    for (var i = 0; i < data.length; i++) {
      int _textColor = ThemeConfig.tabTextColor;
      int _borderColor = ThemeConfig.defaultBorderColor;
      double _width = 0.5;

      if (i == index) {
        _textColor = ThemeConfig.tabTextCurrentColor;
        _borderColor = ThemeConfig.tabBorderCurrentColor;
        _width = 2;
      }

      _option.add(
        Expanded(child:
          GestureDetector(
            behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
            onTap: () => callback(data[i]),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(_borderColor), width: _width),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(data[i]['text'], style: TextStyle(
                    fontSize: 14 * Global.pr,
                    color: Color(_textColor),
                  )),
                ],
              ),
            )
          )
        )
      );
    }

    return Container(
      height: 49 * Global.pr,
      color: Color(ThemeConfig.defaultBgColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _option,
      ),
    );
  }
}