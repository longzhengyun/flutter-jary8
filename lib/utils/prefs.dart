import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static const KEY_LOGIN_TOKEN = 'loginToken'; /// 登录 token
  static const KEY_LOGIN_INFO = 'loginInfo'; /// 登录 时间

  static getValue(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.get(key);
  }

  static removeValue(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(key);
  }

  static setStringValue(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }
}
