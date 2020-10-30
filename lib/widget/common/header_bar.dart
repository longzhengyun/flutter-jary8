import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  HeaderBar(this.data, { Key key, this.action = const [], this.callback }) : super(key: key);

  final Map data;
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
              color: Color(data['highlight'] ?? false ? ThemeConfig.headerHighlightColor : ThemeConfig.headerColor),
            ))
            :
            Image.asset(item['icon'], width: 24 * Global.pr, height: 24 * Global.pr,)
        ),
      ));
    }

    return AppBar(
      title: Text(data['title'] ?? '', style: TextStyle(
        fontSize: 18 * Global.pr,
        color: Color(data['highlight'] ?? false ? ThemeConfig.headerHighlightColor : ThemeConfig.headerColor),
        fontWeight: FontWeight.bold,
      )),
      brightness: data['highlight'] ?? false ? Brightness.dark : Brightness.light,
      centerTitle: true,
      leading: data['hideBack'] ?? false ? null : IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Color(data['highlight'] ?? false ? ThemeConfig.headerHighlightColor : ThemeConfig.headerColor),),
        onPressed: () => data['backTap'] ?? false ? callback('BackTap') : Navigator.pop(context),
      ),
      actions: _option,
      elevation: data['hideline'] ?? false ? 0 : 0.2,
      backgroundColor: Color(data['highlight'] ?? false ? ThemeConfig.headerHighlightBgColor : ThemeConfig.headerBgColor),
    );
  }
}