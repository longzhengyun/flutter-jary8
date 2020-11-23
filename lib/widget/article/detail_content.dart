import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailContent extends StatelessWidget {
  DetailContent(this.data, this.callback, { Key key }) : super(key: key);

  final String data;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return data != null ? Container(
      color: Color(ThemeConfig.defaultBgColor),
      padding: EdgeInsets.all(20 * Global.pr),
      margin: EdgeInsets.only(top: 10 * Global.pr),
      child: Html(
        data: data,
        onLinkTap: (url) {
          if (url.contains('http')) callback(url);
        },
        style: {
          'pre': Style(
            fontSize: FontSize(12 * Global.pr),
            padding: EdgeInsets.all(10 * Global.pr),
            backgroundColor: Color(ThemeConfig.defaultPageBgColor)
          ),
        },
      )
    ) : Container();
  }
}