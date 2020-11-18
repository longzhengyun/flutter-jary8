class AppConfig {
  static const bool inProduction = const bool.fromEnvironment('dart.vm.product');
}

class ApiConfig {
  /// 检查是否登录
  static const String USER_CHECK_LOGIN = '/user/check-login';

  /// 获取用户信息
  static const String USER_INFO = '/user/info';
}