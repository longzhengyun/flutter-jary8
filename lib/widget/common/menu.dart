import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class Menu extends StatelessWidget {
  Menu(this.data, this.index, this.callback, { Key key }) : super(key: key);

  final List data;
  final int index;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    List<Widget> _option = [];

    for (var i = 0; i < data.length; i++) {
      // String _icon = ThemeConfig.bottomBarIcon[i]['icon'];
      int _color = ThemeConfig.menuTextColor;
      if (i == index) {
        // _icon = ThemeConfig.bottomBarIcon[i]['iconCurrent'];
        _color = ThemeConfig.menuTextCurrentColor;
      }

      _option.add(
        GestureDetector(
          behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
          onTap: () => callback(i),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Image.asset(_icon, width: 22 * Global.pr, height: 22 * Global.pr,),
              Text(data[i], style: TextStyle(
                fontSize: 11 * Global.pr,
                color: Color(_color),
              )),
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
          color: Color(ThemeConfig.menuItemBgColor),
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