import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class ResumeIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 20 * Global.pr, bottom: 20 * Global.pr),
      child: ClipOval(
        child: Image.asset(ThemeConfig.resumeIcon, width: 120 * Global.pr, height: 120 * Global.pr),
      )
    );
  }
}