import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class HomeSearch extends StatelessWidget {
  HomeSearch(this.callback, { Key key }) : super(key: key);

  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(ThemeConfig.defaultBgColor),
      padding: EdgeInsets.all(20 * Global.pr),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
        onTap: () => callback(),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(ThemeConfig.defaultBorderColor), width: 0.5),
            borderRadius: BorderRadius.circular(6 * Global.pr),
          ),
          padding: EdgeInsets.all(5 * Global.pr),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 30 * Global.pr,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 5 * Global.pr),
                child: Text('搜索感兴趣的前端文章和网站', style: TextStyle(
                  fontSize: 16 * Global.pr,
                  color: Color(ThemeConfig.homeSearchTextColor),
                  height: 1,
                )),
              ),
              Container(
                width: 60 * Global.pr,
                height: 30 * Global.pr,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(6 * Global.pr),
                    topRight: Radius.circular(6 * Global.pr),
                  ),
                  color: Color(ThemeConfig.homeSearchBtnBgColor)
                ),
                child: Icon(Icons.search, color: Color(ThemeConfig.defaultTextColor), size: 20 * Global.pr),
              ),
            ],
          ),
        )
      ),
    );
  }
}