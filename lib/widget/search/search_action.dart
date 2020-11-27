import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class SearchAction extends StatelessWidget {
  SearchAction(this.selectText, this.searchText, this.callback, { Key key }) : super(key: key);

  final String selectText;
  final String searchText;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(ThemeConfig.defaultBgColor),
      padding: EdgeInsets.all(20 * Global.pr),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(ThemeConfig.defaultBorderColor), width: 0.5),
          borderRadius: BorderRadius.circular(6 * Global.pr),
        ),
        padding: EdgeInsets.all(5 * Global.pr),
        child: Row(
          children: <Widget>[
            GestureDetector(
              behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
              onTap: () => callback('Select'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(selectText, style: TextStyle(
                    fontSize: 14 * Global.pr,
                    color: Color(ThemeConfig.defaultTextColor),
                    height: 1,
                  )),
                  Icon(Icons.arrow_drop_down, color: Color(ThemeConfig.defaultTextColor), size: 20 * Global.pr),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 30 * Global.pr,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 5 * Global.pr),
                child: TextField(
                  maxLength: 100,
                  minLines: 1,
                  maxLines: 2,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontSize: 14 * Global.pr,
                    color: Color(ThemeConfig.defaultTextColor),
                    height: 1,
                  ),
                  controller: TextEditingController.fromValue(TextEditingValue(
                    text: searchText,
                    selection: TextSelection.fromPosition(
                      TextPosition(
                        affinity: TextAffinity.downstream,
                        offset: searchText.length,
                      )
                    ),
                  )),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '搜索感兴趣的前端文章和网站',
                    isDense: true,
                    counterText: '',
                  ),
                  onChanged: (text) => callback('Input', data: text),
                )
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque, /// 解决点击空白处无效问题
              onTap: () => callback('Search'),
              child: Container(
                width: 60 * Global.pr,
                height: 30 * Global.pr,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(6 * Global.pr),
                    topRight: Radius.circular(6 * Global.pr),
                  ),
                  color: Color(ThemeConfig.searchBtnBgColor)
                ),
                child: Icon(Icons.search, color: Color(ThemeConfig.defaultTextColor), size: 20 * Global.pr),
              ),
            ),
          ],
        ),
      )
    );
  }
}