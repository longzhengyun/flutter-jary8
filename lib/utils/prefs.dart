import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static const KEY_API_TOKEN = 'apiToken'; /// app接口token

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
