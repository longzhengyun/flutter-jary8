import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:jaryapp/api/config.dart';
import 'package:jaryapp/api/index.dart';
import 'package:jaryapp/routes/routes.dart';
import 'package:jaryapp/utils/prefs.dart';
import 'package:jaryapp/utils/theme_config.dart';
import 'package:jaryapp/widget/common/app_header.dart';
import 'package:jaryapp/widget/common/nothing.dart';
import 'package:jaryapp/widget/common/select_dialog.dart';
import 'package:jaryapp/widget/common/warn_dialog.dart';
import 'package:jaryapp/widget/search/search_action.dart';
import 'package:jaryapp/widget/search/search_item.dart';
import 'package:jaryapp/widget/search/search_title.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List _searchOption = [
    { 'text': '文章', 'value': 0 },
    { 'text': '网站', 'value': 1 },
  ];

  int _searchType = 0; /// 0 历史搜索 1 内容搜索
  String _searchTitle;
  String _searchText = '';

  int _selectValue; /// 0 文章搜索 1 网站搜索
  String _selectText = '';

  int _searchIndex = 1;
  List _searchList = [];

  @override
  void initState() {
    super.initState();

    _changeSearchType(0);
    _changeSelectValue(0);
    _getHistorySearch();
  }

  void _changeSearchType(int index, { String searchText = '' }) {
    setState(() {
      _searchType = index;
      _searchTitle = index == 0 ? '搜索历史' : '搜索结果';
      _searchText = searchText;
    });
  }

  void _changeSelectValue(int index) {
    setState(() {
      _selectValue = index;
      _selectText = _searchOption[index]['text'];
    });
  }

  void _onSearchTap(String key, { String data }) {
    if (key == 'Select') {
      FocusScope.of(context).requestFocus(FocusNode()); /// 点击空白处隐藏键盘

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return SelectDialog(_searchOption, _onSelectDialogTap, selected: _selectValue);
        }
      );
    }

    if (key == 'Input') {
      _changeSearchType(1, searchText: data.trim());
    }

    if (key == 'Search' && _searchText.isNotEmpty) {
      FocusScope.of(context).requestFocus(FocusNode()); /// 点击空白处隐藏键盘

      _changeSearchType(1, searchText: _searchText);
      _getSearchData(1, _searchText, _selectValue);
      _saveHistorySearch(_searchText, _selectValue); /// 保存搜索记录
    }
  }

  void _onSelectDialogTap(Map data) {
    Navigator.pop(context);

    if (data != null) {
      _changeSelectValue(data['value']);
    }
  }

  /// 获取历史搜索数据
  void _getHistorySearch() async {
    List _list = [];
    String _historySearch = await Prefs.getValue(Prefs.KEY_HISTORY_SEARCH);

    if (_historySearch != null) {
      _list = json.decode(_historySearch);
    }

    setState(() {
      _searchList = _list;
    });
  }

  /// 保持历史搜索数据
  void _saveHistorySearch(String searchText, int selectValue) async {
    List _list = [];
    String _historySearch = await Prefs.getValue(Prefs.KEY_HISTORY_SEARCH);

    Map _saveData = { 'title': '${_searchOption[selectValue]['text']}：$searchText', 'searchText': searchText, 'selectValue': selectValue };

    if (_historySearch != null) {
      _list = json.decode(_historySearch);

      bool _ishas = false; /// 是否包涵当前搜索内容
      for (var item in _list) {
        if (item['title'] == _saveData['title'] && item['selectValue'] == _saveData['selectValue']) {
          _ishas = true;
        }
      }

      if (!_ishas) {
        _list.add(_saveData);
      }
    } else {
      _list.add(_saveData);
    }

    await Prefs.setStringValue(Prefs.KEY_HISTORY_SEARCH, json.encode(_list));
  }

  /// 获取搜索数据
  void _getSearchData(int index, String searchText, int selectValue) async {
    try {
      Map _params = { 'index': index, 'keyword': searchText, 'type': selectValue };

      List _result = await ApiFetch.apiFetch(ApiConfig.SEARCH, params: _params);

      int _index = _searchIndex;
      List _list = _searchList;
      if (_result.isNotEmpty) {
        if (index == 1) {
          _list = _result;
        } else {
          _list.addAll(_result);
        }

        _index = index + 10;
      }

      setState(() {
        _searchIndex = _index;
        _searchList = _list;
      });
    } catch (e) {
    }
  }

  void _onClearTap() {
    if (_searchType == 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return WarnDialog(title: '清除搜索历史数据', content: '确定要清除所有搜索历史数据吗？', confirm: '清除', cancel: '取消', callback: _onWarnTap);
        }
      );
    } else {
      _changeSearchType(0);
      _changeSelectValue(0);
      _getHistorySearch();
    }
  }

  void _onWarnTap(bool state) async {
    Navigator.pop(context);

    if (state) {
      await Prefs.removeValue(Prefs.KEY_HISTORY_SEARCH);

      _changeSearchType(0);
      _changeSelectValue(0);
      _getHistorySearch();
    }
  }

  void _onItemTap(Map data) {
    if (_searchType == 0) {
      _getSearchData(1, data['searchText'], data['selectValue']);
      _changeSearchType(1, searchText: data['searchText']);
      _changeSelectValue(data['selectValue']);
    } else {
      if (_selectValue == 0) {
        Routes.navigateTo(context, Routes.articleDetail, params: { 'id': data['id'].toString() });
      }

      if (_selectValue == 1) {
        Routes.navigateTo(context, Routes.otherView, params: { 'url': data['url'], 'title': data['title'] });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: '搜索'),
      body: EasyRefresh.custom(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              SearchAction(_selectText, _searchText, _onSearchTap),
              _searchList.isNotEmpty ? SearchTitle(_searchTitle, _onClearTap) : Container(),
            ])
          ),
          SliverList(
            delegate: _searchList.isNotEmpty ? SliverChildBuilderDelegate((BuildContext context, int index) {
              return SearchItem(_searchList[index], index, _onItemTap);
            }, childCount: _searchList.length) : SliverChildListDelegate(<Widget>[
              Nothing()
            ]),
          )
        ],
        header: MaterialHeader(
          valueColor: AlwaysStoppedAnimation(Color(ThemeConfig.loadingColor)),
        ),
        onRefresh: () async {
          _getSearchData(1, _searchText, _selectValue);
        },
        footer: MaterialFooter(
          valueColor: AlwaysStoppedAnimation(Color(ThemeConfig.loadingColor)),
          enableInfiniteLoad: false, /// 关闭无限加载模式
        ),
        onLoad: () async {
          _getSearchData(_searchIndex, _searchText, _selectValue);
        },
      )
    );
  }
}