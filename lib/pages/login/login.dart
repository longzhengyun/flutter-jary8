import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:jaryapp/api/config.dart';
import 'package:jaryapp/api/index.dart';
import 'package:jaryapp/utils/event_bus.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/widget/common/app_btn.dart';
import 'package:jaryapp/widget/common/app_header.dart';
import 'package:jaryapp/widget/common/form_item.dart';
import 'package:oktoast/oktoast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _userName = '';
  String _password = '';

  void _onFormTap(String key, String text) {
    if (key == 'UserName') {
      setState(() {
        _userName = text.trim();
      });
    }

    if (key == 'Password') {
      setState(() {
        _password = text.trim();
      });
    }
  }

  void _onLoginTap() async {
    FocusScope.of(context).requestFocus(FocusNode()); /// 点击空白处隐藏键盘

    if (_userName.isEmpty || _password.isEmpty) {
      showToast('请输入正确内容');
      return;
    }

    try {
      await ApiFetch.apiFetch(ApiConfig.USER_LOGIN, params: { 'userName': _userName, 'password': _password } );
      EventBus.instance.commit(EventKeys.LoginState, true); /// 通知改变登录状态
      Navigator.pop(context);
    } catch (e) {
      showToast('登录失败，请重新登录！');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: '登录'),
      body: EasyRefresh.custom(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              FormItem('用户名', _userName, 'UserName', _onFormTap, hint: '请输入用户名', hideLine: true),
              FormItem('密码', _password, 'Password', _onFormTap, hint: '请输入密码', isPassword: true),
              GestureDetector(
                behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
                onTap: () => _onLoginTap(),
                child: Container(
                  padding: EdgeInsets.all(20 * Global.pr),
                  child: AppBtn('登录', isHighlight: true),
                ),
              ),
            ])
          ),
        ],
      )
    );
  }
}