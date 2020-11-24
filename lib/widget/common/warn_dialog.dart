import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:jaryapp/widget/common/app_btn.dart';

class WarnDialog extends StatefulWidget {
  WarnDialog({ Key key, this.title, this.content, this.confirm, this.cancel, this.callback }) : super(key: key);

  final String title;
  final String content;
  final String confirm;
  final String cancel;
  final Function callback;

  @override
  _WarnDialogState createState() => _WarnDialogState();
}

class _WarnDialogState extends State<WarnDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ThemeConfig.defaultMaskBgColor),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20 * Global.pr),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10 * Global.pr)),
                color: Color(ThemeConfig.defaultBgColor),
              ),
              child: Column(
                children: <Widget>[
                  widget.title != null ? Container(
                    height: 40 * Global.pr,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Color(ThemeConfig.dialogBorderColor), width: 0.5)),
                    ),
                    child: Text(widget.title, style: TextStyle(
                      fontSize: 15 * Global.pr,
                      fontWeight: FontWeight.bold,
                      color: Color(ThemeConfig.defaultTextColor),
                    )),
                  ) : Container(),
                  widget.content != null ? Container(
                    padding: EdgeInsets.only(left: 20 * Global.pr, right: 20 * Global.pr, top: 30 * Global.pr, bottom: 10 * Global.pr),
                    child: Text(widget.content, style: TextStyle(
                      fontSize: 15 * Global.pr,
                      color: Color(ThemeConfig.dialogTextColor),
                    )),
                  ) : Container(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      widget.cancel != null ? Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
                          onTap: () => widget.callback(false),
                          child: Container(
                            padding: EdgeInsets.only(left: 20 * Global.pr, right: widget.confirm != null ? 10 * Global.pr : 20 * Global.pr, top: 20 * Global.pr, bottom: 20 * Global.pr),
                            child: AppBtn(widget.cancel)
                          ),
                        )
                      ) : Container(),
                      widget.confirm != null ? Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
                          onTap: () => widget.callback(true),
                          child: Container(
                            padding: EdgeInsets.only(left: widget.cancel != null ? 10 * Global.pr : 20 * Global.pr, right: 20 * Global.pr, top: 20 * Global.pr, bottom: 20 * Global.pr),
                            child: AppBtn(widget.confirm, isHighlight: true)
                          ),
                        )
                      ) : Container(),
                    ],
                  ),
                ]
              ),
            )
          ]
        )
      )
    );
  }
}