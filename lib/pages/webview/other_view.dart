import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:jaryapp/widget/common/app_header.dart';

class OtherView extends StatefulWidget {
  OtherView(this.url, { Key key, this.title }) : super(key: key);

  final String url;
  final String title;

  @override
  _OtherViewState createState() => _OtherViewState();
}

class _OtherViewState extends State<OtherView> {
  String _headerTitle = '';

  List _headerAction = [
    { 'key': 'Close', 'type': 0, 'text': '关闭' },
  ];

  /// webView 控制器
  WebViewController _controller;

  /// 隐藏webview 解决加载webview黑屏问题
  double _opacity = 0;

  @override
  void initState() {
    super.initState();

    _setTitle(); /// 设置title
  }

  /// 导航点击事件
  void _onBarTap(key) {
    if (key == 'Close') {
      Navigator.pop(context);
    }
  }

  /// 获取当前加载页面的 title
  void _setTitle() async {
    String _title = '';
    if (widget.title.isNotEmpty) {
      _title = widget.title;
    } else {
      try {
        _title = await _controller.getTitle();
      } catch (e) {
      }
    }

    setState(() {
      _headerTitle = _title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: _headerTitle, action: _headerAction, callback: _onBarTap),
      body: Builder(builder: (BuildContext context) {
        return Opacity(
          opacity: _opacity,
          child: WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              _controller = controller;
            },
            onPageStarted: (url) {
              setState(() {
                _opacity = 1;
              });
            },
            onPageFinished: (url) {
              _setTitle(); /// 设置title
            },
          ),
        );
      })
    );
  }
}
