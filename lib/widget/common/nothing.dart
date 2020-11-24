import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class Nothing extends StatelessWidget {
  Nothing({ Key key, this.text = '暂无数据' }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20 * Global.pr, bottom: 20 * Global.pr,),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Image.asset(ThemeConfig.nothingIcon, width: 204 * Global.pr, height: 187 * Global.pr),
          Container(
            margin: EdgeInsets.only(left: 20 * Global.pr, right: 20 * Global.pr, top: 10 * Global.pr),
            child: Text(text,
              style: TextStyle(
                fontSize: 12 * Global.pr,
                color: Color(ThemeConfig.nothingTextColor),
              )
            ),
          )
        ]
      )
    );
  }
}