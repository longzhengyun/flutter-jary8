import 'package:jaryapp/api/config.dart';

class AppConfig {
  static const bool inProduction = const bool.fromEnvironment('dart.vm.product');
}

class ApiConfig {
  /// 获取用户信息
  static const String USER_INFO = '/user/info';
}

class ApiQuery {
  static Future dbQuery(String url, { Map data }) async {
    if (url == ApiConfig.USER_INFO) {
      return await DBConfig().userInfoQuery();
    }
  }

  /// post请求
  static Future query(String url, { Map params }) async {
    try {
      Map _response = await dbQuery(url, data: params);
      if(!AppConfig.inProduction){
        print('------------response-------------');
        print(url);
        print(_response);
        print('-----------------------------');
      }
      if (_response != null) {
        return { 'code': 0, 'data': _response, 'message': 'success' };
      } else {
        throw { 'code': -1, 'message': 'error' };
      }
    } catch (e) {
      throw { 'code': -1, 'message': 'error' };
    }
  }
}