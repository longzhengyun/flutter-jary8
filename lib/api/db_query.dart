import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

import 'package:jaryapp/api/index.dart';
import 'package:jaryapp/utils/prefs.dart';

String generateMd5(String data) {
  var content = new Utf8Encoder().convert(data);
  var digest = md5.convert(content);
  return hex.encode(digest.bytes);
}

class DBQuery {
  Future<Map> userLogin(String userName, String password) async {
    Map _result;

    String _name = 'admin_data';
    List<String> _columns = ['id', 'username', 'password', 'nickname'];

    try {
      List _data = await ApiFetch.dbFetch(_name, columns: _columns);

      String _dbToken = '';
      Map _loginInfo = {
        'time': DateTime.now().millisecondsSinceEpoch
      };
      _data.forEach((element) {
        if (element['username'] == userName && element['password'] == password) {
          _dbToken = generateMd5(json.encode({ 'id': element['id'], 'username': element['username'], 'nickname': element['nickname'] }));
          _loginInfo.addAll(element);
        }
      });

      if (_dbToken.isNotEmpty) {
        await Prefs.setStringValue(Prefs.KEY_LOGIN_TOKEN, _dbToken);
        await Prefs.setStringValue(Prefs.KEY_LOGIN_INFO, json.encode(_loginInfo));

        _result = {};
      }
    } catch (e) {
    }

    return _result;
  }

  Future<Map> userCheckLogin() async {
    Map _result;

    String _name = 'admin_data';
    List<String> _columns = ['id', 'username', 'nickname'];

    try {
      List _data = await ApiFetch.dbFetch(_name, columns: _columns);

      String _loginToken = await Prefs.getValue(Prefs.KEY_LOGIN_TOKEN);
      String _loginInfoString = await Prefs.getValue(Prefs.KEY_LOGIN_INFO);

      if (_data.isNotEmpty && _loginToken != null && _loginInfoString != null) {
        Map _loginInfo = json.decode(_loginInfoString);
        int _time = new DateTime.now().millisecondsSinceEpoch;
        if (_time -_loginInfo['time'] < 1000 * 60 * 60 * 24 * 7) {
          _data.forEach((element) {
            String _dbToken = generateMd5(json.encode(element));
            if (_dbToken == _loginToken && element['username'] == _loginInfo['username']) {
              _result = element;
            }
          });
        } else {
          await Prefs.removeValue(Prefs.KEY_LOGIN_TOKEN);
          await Prefs.removeValue(Prefs.KEY_LOGIN_INFO);
        }
      }
    } catch (e) {
    }

    return _result;
  }

  Future<Map> userInfo() async {
    Map _result;

    String _name = 'user_data';
    List<String> _columns = ['nickname', 'email', 'city', 'job', 'motto'];

    try {
      List _data = await ApiFetch.dbFetch(_name, columns: _columns);

      if (_data.isNotEmpty) {
        _result = _data.first;
      }
    } catch (e) {
    }

    return _result;
  }

  Future<Map> userDetail(String category) async {
    Map _result;

    String _name = 'user_data';
    List<String> _columns;

    switch (category) {
      case 'evaluation':
        _columns = ['info'];
        break;
      case 'skill':
        _columns = ['skill'];
        break;
      case 'experience':
        _columns = ['experience'];
        break;
      case 'other':
        _columns = ['other'];
        break;
      default:
        _columns = ['nickname', 'birthday', 'phone', 'email', 'github', 'degrees', 'major', 'job', 'worklife', 'state', 'salary'];
    }

    try {
      List _data = await ApiFetch.dbFetch(_name, columns: _columns);

      if (_data.isNotEmpty) {
        _result = _data.first;
      }
    } catch (e) {
    }

    return _result;
  }

  Future<List> articleHot() async {
    List _result = [];

    String _name = 'article_data';
    List<String> _columns = ['id', 'title'];
    String _where = 'hot="y"';

    try {
      _result = await ApiFetch.dbFetch(_name, columns: _columns, where: _where);
    } catch (e) {
    }

    return _result;
  }

  Future<List> articleRecommend(int id, String category) async {
    List _result = [];

    String _name = 'article_data';
    List<String> _columns = ['id', 'title'];
    String _where = 'category="$category" AND id!="$id"';
    int _limit = 6;

    try {
      _result = await ApiFetch.dbFetch(_name, columns: _columns, where: _where, limit: _limit);
    } catch (e) {
      print(e);
    }

    return _result;
  }

  Future<Map> articleDetail(int id) async {
    Map _result;

    String _name = 'article_data';
    List<String> _columns = ['id', 'title', 'date', 'content', 'category'];
    String _where = 'id="$id"';

    try {
      List _data = await ApiFetch.dbFetch(_name, columns: _columns, where: _where);

      if (_data.isNotEmpty) {
        _result = _data.first;
      }
    } catch (e) {
    }

    return _result;
  }

  Future<List> articleList(int index, String category, int limit) async {
    List _result = [];

    String _name = 'article_data';
    List<String> _columns = ['id', 'title', 'description', 'date', 'category', 'hot'];
    String _where = category.isNotEmpty ? 'category="$category"' : null;

    try {
      _result = await ApiFetch.dbFetch(_name, columns: _columns, where: _where, limit: limit, offset: index - 1);
    } catch (e) {
    }

    return _result;
  }

  Future<List> siteHot() async {
    List _result = [];

    String _name = 'site_data';
    List<String> _columns = ['id', 'title', 'url'];
    String _where = 'hot="y"';
    int _limit = 8;

    try {
      _result = await ApiFetch.dbFetch(_name, columns: _columns, where: _where, limit: _limit);
    } catch (e) {
    }

    return _result;
  }

  Future<List> siteList(int index, String category, int limit) async {
    List _result = [];

    String _name = 'site_data';
    List<String> _columns = ['id', 'title', 'description', 'url', 'category', 'hot'];
    String _where = category.isNotEmpty ? 'category="$category"' : null;

    try {
      _result = await ApiFetch.dbFetch(_name, columns: _columns, where: _where, limit: limit, offset: index - 1);
    } catch (e) {
    }

    return _result;
  }

  Future<List> search(int index, String keyword, int limit, int type) async {
    List _result = [];

    String _name = '';
    List<String> _columns = [];
    String _where = 'title LIKE "%$keyword%"';

    if (type == 0) {
      _name = 'article_data';
      _columns = ['id', 'title'];
    }

    if (type == 1) {
      _name = 'site_data';
      _columns = ['id', 'title', 'url'];
    }

    try {
      _result = await ApiFetch.dbFetch(_name, columns: _columns, where: _where, limit: limit, offset: index - 1);
    } catch (e) {
    }

    return _result;
  }
}