import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class HomeLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(ThemeConfig.defaultBgColor),
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 20 * Global.pr),
      child: Image.asset(ThemeConfig.homeLoginIcon, width: 160 * Global.pr, height: 50 * Global.pr),
    );
  }
}