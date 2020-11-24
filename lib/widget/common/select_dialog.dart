import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class SelectDialog extends StatefulWidget {
  SelectDialog(this.data, this.callback, { Key key, this.selected }) : super(key: key);

  final List data;
  final Function callback;
  final dynamic selected;

  @override
  _SelectDialogState createState() => _SelectDialogState();
}

class _SelectDialogState extends State<SelectDialog> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _content = [];
    List<Widget> _option = [];

    for (var item in widget.data) {
      _option.add(GestureDetector(
        behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
        onTap: () => widget.callback(item),
        child: Container(
          height: 48 * Global.pr,
          margin: EdgeInsets.only(left: 20 * Global.pr, right: 20 * Global.pr, bottom: 10 * Global.pr),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10 * Global.pr)),
            color: Color(ThemeConfig.defaultBgColor),
          ),
          child: Text(item['text'],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15 * Global.pr,
              color: Color(widget.selected == item['value'] ? ThemeConfig.dialogSelectedColor : ThemeConfig.dialogTextColor),
            )
          )
        ),
      ));
    }

    _content.add(Container(
      height: widget.data.length > 8 ? 474 * Global.pr : 58 * widget.data.length * Global.pr,
      child: ListView(
        children: _option,
      )
    ));

    _content.add(Container(
      height: 48 * Global.pr,
      margin: EdgeInsets.all(20 * Global.pr),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10 * Global.pr)),
        color: Color(ThemeConfig.defaultBgColor),
      ),
      child: Text('取消', style: TextStyle(
        fontSize: 15 * Global.pr,
        fontWeight: FontWeight.bold,
        color: Color(ThemeConfig.dialogTextColor),
      ))
    ));

    return Scaffold(
      backgroundColor: Color(ThemeConfig.defaultMaskBgColor),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
        onTap: () => widget.callback(null),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: _content
          )
        )
      )
    );
  }
}