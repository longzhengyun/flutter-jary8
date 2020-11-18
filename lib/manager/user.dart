import 'package:jaryapp/models/user.dart';

/// 用户管理单例
class UserManager{
  factory UserManager() => _getInstance();

  static UserManager get instance => _getInstance();
  static UserManager _instance;
  User user;   /// 用户信息

  UserManager._internal();

  static UserManager _getInstance() {
    if (_instance == null) {
      _instance = UserManager._internal();
    }

    return _instance;
  }

  bool get isLogin{
    return user != null;
  }
}