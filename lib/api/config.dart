import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBConfig {
  static String _dbName = 'jary_data.db';
  static String _defaultData = join('assets', 'data/$_dbName');

  /// 初始化
  static void init() async {
    String _path = await getPath(_dbName);

    bool _exists = await databaseExists(_path);
    if(!_exists) {
      ByteData _data = await rootBundle.load(_defaultData);
      List<int> _bytes = _data.buffer.asUint8List(_data.offsetInBytes, _data.lengthInBytes);

      await new File(_path).writeAsBytes(_bytes);
    }
  }

  /// 获取路径
  static Future<String> getPath(dbName) async {
    String _databasesPath = await getDatabasesPath();
    return join(_databasesPath, dbName);
  }

  /// 查询
  static Future<List> query(String table, { List<String> columns }) async {
    List _result = [];
    String _path = await getPath(_dbName);
    Database _db = await openDatabase(_path);
    List<Map> _data = await _db.query(table, columns: columns);
    if (_data != null && _data.isNotEmpty) {
      _data.forEach((element) {
        String _item = json.encode(element);
        _result.add(json.decode(_item));
      });
    }

    await _db.close();
    return _result;
  }

  Future<Map> userInfoQuery() async {
    Map _result;

    try {
      List _data = await query('user_data', columns: ['nickname', 'email', 'city', 'job', 'motto']);

      if (_data.isNotEmpty) {
        _result = _data.first;
      }
    } catch (e) {
    }

    return _result;
  }
}