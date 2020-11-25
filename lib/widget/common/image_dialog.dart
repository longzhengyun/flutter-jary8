import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:jaryapp/widget/common/app_btn.dart';

class ImageDialog extends StatefulWidget {
  ImageDialog(this.data, { Key key, this.confirm, this.cancel = '取消', this.isLocal = false, this.isBase64 = false, this.callback }) : super(key: key);

  final Map data;
  final String confirm;
  final String cancel;
  final bool isLocal;
  final bool isBase64;
  final Function callback;

  @override
  _ImageDialogState createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ThemeConfig.defaultMaskBgColor),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
        onTap: () => Navigator.pop(context),
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
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  widget.isLocal ? ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10 * Global.pr),
                      topRight: Radius.circular(10 * Global.pr),
                    ),
                    child: Image.asset(widget.data['url'], fit: BoxFit.contain),
                  ) : Container(),
                  widget.isBase64 ? ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10 * Global.pr),
                      topRight: Radius.circular(10 * Global.pr),
                    ),
                    child: Image.memory(base64.decode(widget.data['url'].split(',')[1]), fit: BoxFit.contain, gaplessPlayback: true),
                  ) : Container(),
                  (!widget.isLocal && !widget.isBase64) ? CachedNetworkImage(
                    imageUrl: widget.data['url'],
                    imageBuilder: (context, imageProvider) => Container(
                      height: 400 * Global.pr,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10 * Global.pr),
                          topRight: Radius.circular(10 * Global.pr),
                        ),
                        image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20 * Global.pr),
                      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Color(ThemeConfig.loadingColor)), strokeWidth: 2)
                    ),
                  ) : Container(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: EdgeInsets.all(10 * Global.pr),
                            child: AppBtn(widget.cancel)
                          ),
                        )
                      ),
                      widget.confirm != null ? Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
                          onTap: () => widget.callback != null ? widget.callback(data: widget.data) : Navigator.pop(context),
                          child: Container(
                            padding: EdgeInsets.all(10 * Global.pr),
                            child: AppBtn(widget.confirm, isHighlight: true)
                          ),
                        )
                      ) : Container(),
                    ],
                  ),
                ]
              )
            )
          ],
        ),
      )
    );
  }
}