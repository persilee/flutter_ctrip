import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

import 'navigator/tab_navigater.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FCtrip',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'PingFang',
      ),
      home: TabNavigator(),
    );
  }
}
