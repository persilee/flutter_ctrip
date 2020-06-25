import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class NavigatorUtil {

  ///跳转到指定页面
  // ignore: avoid_init_to_null
  static push(BuildContext context, Widget page, { Function callBack }) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page)).then((res) {
      ///获取返回处理
      callBack != null ? callBack() : print('not fount callBack');
    });
  }
}
