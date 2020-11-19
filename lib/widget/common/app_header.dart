import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  AppHeader({ Key key, this.title = '', this.hideBack = false, this.backTap = false, this.highlight = false, this.action = const [], this.callback }) : super(key: key);

  final String title;
  final bool hideBack;
  final bool backTap;
  final bool highlight;
  final List action;
  final Function callback;

  @override
  Size get preferredSize {
    return Size.fromHeight(56 * Global.pr);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _option = [];

    for (var item in action) {
      _option.add(GestureDetector(
        behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
        onTap: () {
          callback(item['key']);
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 16 * Global.pr, right: 16 * Global.pr,),
          child: item['type'] == 0 ?
            Text(item['text'], style: TextStyle(
              fontSize: 16 * Global.pr,
              color: Color(highlight ? ThemeConfig.headerHighlightColor : ThemeConfig.headerTextColor),
            ))
            :
            Image.asset(item['icon'], width: 24 * Global.pr, height: 24 * Global.pr,)
        ),
      ));
    }

    return AppBar(
      title: Text(title, style: TextStyle(
        fontSize: 18 * Global.pr,
        color: Color(highlight ? ThemeConfig.headerHighlightColor : ThemeConfig.headerTextColor),
        fontWeight: FontWeight.bold,
      )),
      brightness: highlight ? Brightness.dark : Brightness.light,
      centerTitle: true,
      leading: hideBack ? null : IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Color(highlight ? ThemeConfig.headerHighlightColor : ThemeConfig.headerTextColor),),
        onPressed: () => backTap ? callback('BackTap') : Navigator.pop(context),
      ),
      actions: _option,
      elevation: highlight ? 0 : 0.2,
      backgroundColor: Color(highlight ? ThemeConfig.headerHighlightBgColor : ThemeConfig.defaultBgColor),
    );
  }
}