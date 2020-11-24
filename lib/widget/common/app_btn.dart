import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class AppBtn extends StatelessWidget {
  AppBtn(this.text, { Key key, this.height = 48, this.fontSize = 16, this.isHighlight = false, this.disable = false }) : super(key: key);

  final String text;
  final int height;
  final int fontSize;
  final bool isHighlight;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * Global.pr,
      padding: EdgeInsets.only(left: 10 * Global.pr, right: 10 * Global.pr),
      alignment: Alignment.center,
      decoration: isHighlight ? BoxDecoration(
        borderRadius: BorderRadius.circular(6 * Global.pr),
        color: Color(disable ? ThemeConfig.btnDisableBgColor : ThemeConfig.btnHighlightBgColor),
      ) : BoxDecoration(
        border: Border.all(color: Color(ThemeConfig.btnBorderColor), width: 0.5),
        borderRadius: BorderRadius.circular(6 * Global.pr),
        color: Color(ThemeConfig.btnBgColor),
      ),
      child: Text(text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: fontSize * Global.pr,
          color: isHighlight ? Color(disable ? ThemeConfig.btnDisableTextColor : ThemeConfig.btnHighlightTextColor) : Color(ThemeConfig.btnTextColor),
        )
      )
    );
  }
}