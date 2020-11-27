import 'package:jaryapp/api/config.dart';
import 'package:jaryapp/api/db_query.dart';

class ApiQuery {
  static Future dbQuery(String url, { Map data }) async {
    if (url == ApiConfig.USER_LOGIN) {
      String _userName = data['userName'];
      String _password = data['password'];
      if (_userName.isNotEmpty && _password.isNotEmpty) {
        return await DBQuery().userLogin(_userName, _password);
      }
    }

    if (url == ApiConfig.USER_CHECK_LOGIN) {
      return await DBQuery().userCheckLogin();
    }

    if (url == ApiConfig.USER_INFO) {
      return await DBQuery().userInfo();
    }

    if (url == ApiConfig.USER_DETAIL) {
      String _category;
      if (data != null) {
        _category = data['category'];
      }
      return await DBQuery().userDetail(_category);
    }

    if (url == ApiConfig.ARTICLE_HOT) {
      return await DBQuery().articleHot();
    }

    if (url == ApiConfig.ARTICLE_RECOMMEND) {
      int _id = data['id'];
      String _category = data['category'];
      if (_id != null && _category.isNotEmpty) {
        return await DBQuery().articleRecommend(_id, _category);
      }
    }

    if (url == ApiConfig.ARTICLE_LIST) {
      int _index = data['index'];
      String _category = data['category'];
      int _limit = data['limit'] ?? 10;
      return await DBQuery().articleList(_index, _category, _limit);
    }

    if (url == ApiConfig.ARTICLE_DETAIL) {
      int _id = data['id'];
      if (_id != null) {
        return await DBQuery().articleDetail(_id);
      }
    }

    if (url == ApiConfig.SITE_HOT) {
      return await DBQuery().siteHot();
    }

    if (url == ApiConfig.SITE_LIST) {
      int _index = data['index'];
      String _category = data['category'];
      int _limit = data['limit'] ?? 10;
      return await DBQuery().siteList(_index, _category, _limit);
    }

    if (url == ApiConfig.EXAMPLE_RECOMMEND) {
      String _id = data['id'];
      String _belong = data['belong'];
      if (_id.isNotEmpty && _belong.isNotEmpty) {
        return await DBQuery().exampleRecommend(_id, _belong);
      }
    }

    if (url == ApiConfig.EXAMPLE_LIST) {
      int _index = data['index'];
      String _category = data['category'];
      int _limit = data['limit'] ?? 10;
      return await DBQuery().exampleList(_index, _category, _limit);
    }

    if (url == ApiConfig.EXAMPLE_DETAIL) {
      String _id = data['id'];
      if (_id.isNotEmpty) {
        return await DBQuery().exampleDetail(_id);
      }
    }

    if (url == ApiConfig.SEARCH) {
      int _index = data['index'];
      String _keyword = data['keyword'];
      int _limit = data['limit'] ?? 10;
      int _type = data['type'];
      return await DBQuery().search(_index, _keyword, _limit, _type);
    }
  }
}