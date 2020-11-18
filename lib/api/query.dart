import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

import 'package:jaryapp/api/config.dart';
import 'package:jaryapp/api/index.dart';
import 'package:jaryapp/utils/prefs.dart';

String generateMd5(String data) {
  var content = new Utf8Encoder().convert(data);
  var digest = md5.convert(content);
  return hex.encode(digest.bytes);
}

class ApiQuery {
  static Future dbQuery(String url, { Map data }) async {
    if (url == ApiConfig.USER_CHECK_LOGIN) {
      return await DBQuery().userCheckLogin();
    }

    if (url == ApiConfig.USER_INFO) {
      return await DBQuery().userInfo();
    }
  }
}

class DBQuery {
  Future<Map> userCheckLogin() async {
    Map _result;

    try {
      List _data = await ApiFetch.dbFetch('admin_data', columns: ['id', 'username', 'nickname']);
      String _loginToken = await Prefs.getValue(Prefs.KEY_LOGIN_TOKEN);
      String _loginInfoString = await Prefs.getValue(Prefs.KEY_LOGIN_INFO);

      if (_data.isNotEmpty && _loginToken != null && _loginInfoString != null) {
        Map _loginInfo = json.decode(_loginInfoString);
        int _time = new DateTime.now().millisecondsSinceEpoch;
        if (_time -_loginInfo['time'] < 1000 * 60 * 60 * 24 * 7) {
          _data.forEach((element) {
            String _dbToken = generateMd5(json.encode(element));
            if (_dbToken == _loginToken && element['username'] == _loginInfo['name']) {
              _result = element;
            }
          });
        } else {
          await Prefs.removeValue(Prefs.KEY_LOGIN_TOKEN);
          await Prefs.removeValue(Prefs.KEY_LOGIN_INFO);
        }
      }
    } catch (e) {
    }

    return _result;
  }

  Future<Map> userInfo() async {
    Map _result;

    try {
      List _data = await ApiFetch.dbFetch('user_data', columns: ['nickname', 'email', 'city', 'job', 'motto']);

      if (_data.isNotEmpty) {
        _result = _data.first;
      }
    } catch (e) {
    }

    return _result;
  }
}