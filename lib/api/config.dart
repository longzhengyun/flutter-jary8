class AppConfig {
  static const bool inProduction = const bool.fromEnvironment('dart.vm.product');
}

class ApiConfig {
  /// 检查登录
  static const String USER_LOGIN = '/user/login';

  /// 检查是否登录
  static const String USER_CHECK_LOGIN = '/user/check-login';

  /// 获取用户基本信息
  static const String USER_INFO = '/user/info';

  /// 获取用户详细信息
  static const String USER_DETAIL = '/user/detail';

  /// 热门文章
  static const String ARTICLE_HOT = '/article/hot';

  /// 文章列表
  static const String ARTICLE_LIST = '/article/list';

  /// 推荐文章
  static const String ARTICLE_RECOMMEND = '/article/recommend';

  /// 文章详情
  static const String ARTICLE_DETAIL = '/article/detail';

  /// 推荐网站
  static const String SITE_HOT = '/sit/hot';

  /// 网站列表
  static const String SITE_LIST = '/site/list';

  /// 搜索
  static const String SEARCH = '/search';
}