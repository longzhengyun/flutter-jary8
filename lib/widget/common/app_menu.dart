import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class AppMenu extends StatelessWidget {
  AppMenu(this.data, this.index, this.callback, { Key key }) : super(key: key);

  final List data;
  final int index;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    List<Widget> _option = [];

    for (var i = 0; i < data.length; i++) {
      int _color = ThemeConfig.menuTextColor;
      if (i == index) {
        _color = ThemeConfig.menuTextCurrentColor;
      }

      _option.add(
        GestureDetector(
          behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
          onTap: () => callback(i),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(data[i], color: Color(_color), size: 26 * Global.pr),
            ],
          ),
        )
      );
    }

    return BottomAppBar(
      elevation: 10,
      color: Color(ThemeConfig.menuBgColor),
      child: Container(
        height: 49 * Global.pr,
        decoration: BoxDecoration(
          color: Color(ThemeConfig.defaultBgColor),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10 * Global.pr),
            topRight: Radius.circular(10 * Global.pr),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _option,
        ),
      )
    );
  }
}