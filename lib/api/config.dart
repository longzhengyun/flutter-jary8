class AppConfig {
  static const bool inProduction = const bool.fromEnvironment('dart.vm.product');
}

class ApiConfig {
  /// 检查是否登录
  static const String USER_CHECK_LOGIN = '/user/check-login';

  /// 获取用户信息
  static const String USER_INFO = '/user/info';

  /// 热门文章
  static const String ARTICLE_HOT = '/article/hot';

  /// 推荐文章
  static const String ARTICLE_RECOMMEND = '/article/recommend';

  /// 文章详情
  static const String ARTICLE_DETAIL = '/article/detail';

  /// 推荐网站
  static const String SITE_HOT = '/sit/hot';

  /// 搜索
  static const String SEARCH = '/search';
}