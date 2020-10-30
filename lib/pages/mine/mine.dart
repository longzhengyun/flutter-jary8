import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:jaryapp/widget/common/header_bar.dart';

class Mine extends StatefulWidget {
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  /// 顶部bar数据
  Map _barData = { 'title': '', 'hideBack': true, 'hideline': true };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      appBar: HeaderBar(_barData),
      body: EasyRefresh.custom(
        slivers: <Widget>[],
        header: MaterialHeader(
          valueColor: AlwaysStoppedAnimation(Color(ThemeConfig.loadingColor)),
        ),
        onRefresh: () async {}
      )
    );
  }
}