import 'dart:convert';
import 'dart:io';

import 'package:jaryapp/api/api_query.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';

import 'package:jaryapp/api/config.dart';

class ApiFetch {
  static String _dbName = 'jary_data.db';
  static String _defaultData = join('assets', 'data/$_dbName');
  static Database _db;

  /// 打开数据库
  static Future initDB() async {
    String _databasesPath = await getDatabasesPath();
    String _path = join(_databasesPath, _dbName);

    bool _exists = await databaseExists(_path);
    if(!_exists) {
      ByteData _data = await rootBundle.load(_defaultData);
      List<int> _bytes = _data.buffer.asUint8List(_data.offsetInBytes, _data.lengthInBytes);

      await new File(_path).writeAsBytes(_bytes);
    }

    _db = await openDatabase(_path);
  }

  /// 关闭数据库
  static void close() async {
    return await _db.close();
  }

  /// 查询
  static Future<List> dbFetch(String table, { List<String> columns, String where, String orderBy = 'id desc', int limit = 10, int offset = 0 }) async {
    List _result = [];

    /// 判断是否打开数据库
    if (_db == null) await initDB();

    List<Map> _data = await _db.query(table, columns: columns, where: where, orderBy: orderBy, limit: limit, offset: offset);
    if (_data != null && _data.isNotEmpty) {
      _data.forEach((element) {
        String _item = json.encode(element);
        _result.add(json.decode(_item));
      });
    }
    return _result;
  }

  /// post请求
  static Future apiFetch(String url, { Map params }) async {
    try {
      dynamic _response = await ApiQuery.dbQuery(url, data: params);

      if(!AppConfig.inProduction){
        print('------------response-------------');
        print(url);
        print(_response);
        print('-----------------------------');
      }

      if (_response != null) {
        return _response;
      } else {
        throw { 'code': -1, 'message': 'error' };
      }
    } catch (e) {
      throw { 'code': -1, 'message': 'error' };
    }
  }
}