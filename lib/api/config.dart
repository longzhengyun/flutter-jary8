import 'package:dio/dio.dart';

import 'package:connectivity/connectivity.dart';

class AppConfig {
  static const bool IS_APK = false;
  static const bool inProduction = const bool.fromEnvironment('dart.vm.product');
}

class ApiConfig {
  static const BASE_URL = AppConfig.inProduction ? '' : ''; /// api地址
}

class ApiPost {
  static Dio dio = Dio();

  static ApiPost _instance;

  static BaseOptions _baseOptions = BaseOptions(baseUrl: ApiConfig.BASE_URL, connectTimeout: 60000, receiveTimeout: 60000);

  factory ApiPost() {
    if (_instance == null) _instance = ApiPost._internal();
    return _instance;
  }

  ApiPost._internal() {
    // 生成一个单例，防止多次打开关闭造成开销
    dio = Dio(_baseOptions);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest:(RequestOptions options) async {
        return options;
      },
      onResponse:(Response response) async {
        /// 在返回响应数据之前做一些预处理
      },
      onError: (DioError e) async {}
    ));
  }

  /// post请求
  static Future post(String url, { Map params }) async {
    Map _result;

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw { 'code': -1, 'message': '' };
    } else {
      Map _paramsData = {};

      try {
        Response _response = await dio.post(url, data: _paramsData);
        if(!AppConfig.inProduction){
          print('------------response-------------');
          print(url);
          print(_response);
          print('-----------------------------');
        }
        if (_response.data['code'] == 0) {
          _result = _response.data['response'];
        } else {
          throw { 'code': _response.data['code'], 'message': _response.data['message'] };
        }
      } on DioError catch (e) {
        throw { 'code': e.response?.statusCode ?? -1, 'message': e.message ?? (e.response?.statusMessage ?? 'error') };
      }
    }

    return _result;
  }
}