import 'package:flutter/material.dart';
import 'package:jaryapp/utils/global.dart';
import 'package:jaryapp/utils/theme_config.dart';

class FormItem extends StatelessWidget {
  FormItem(this.text, this.value, this.formKey, this.callback, { Key key, this.hint = '请输入正确信息', this.hideLine = false }) : super(key: key);

  final String text;
  final String value;
  final String formKey;
  final Function callback;
  final String hint;
  final bool hideLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(ThemeConfig.defaultBgColor),
      padding: EdgeInsets.only(left: 20 * Global.pr, right: 20 * Global.pr),
      child: Container(
        padding: EdgeInsets.only(top: 10 * Global.pr, bottom: 10 * Global.pr),
        decoration: !hideLine ? BoxDecoration(
          border: Border(top: BorderSide(color: Color(ThemeConfig.defaultBorderColor), width: 0.5)),
        ) : null,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(text, style: TextStyle(
              fontSize: 16 * Global.pr,
              height: 1,
              color: Color(ThemeConfig.defaultTextColor),
            )),
            Expanded(
              child: TextField(
                maxLength: 100,
                minLines: 1,
                maxLines: 2,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 14 * Global.pr,
                  color: Color(ThemeConfig.defaultTextColor),
                  height: 1,
                ),
                controller: TextEditingController.fromValue(TextEditingValue(
                  text: value,
                  selection: TextSelection.fromPosition(
                    TextPosition(
                      affinity: TextAffinity.downstream,
                      offset: value.length,
                    )
                  ),
                )),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  isDense: true,
                  counterText: '',
                ),
                onChanged: (text) => callback(formKey, text),
              )
            ),
          ]
        ),
      )
    );
  }
}