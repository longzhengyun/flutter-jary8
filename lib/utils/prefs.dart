import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static const KEY_LOGIN_TOKEN = 'loginToken'; /// 登录token
  static const KEY_LOGIN_INFO = 'loginInfo'; /// 登录时间
  static const KEY_HISTORY_SEARCH = 'historySearch'; /// 历史搜索

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
