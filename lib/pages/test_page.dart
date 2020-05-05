import 'package:flutter/material.dart';
import 'package:flutter_ctrip/plugin/vertical_tab_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<String> s = ['111111','222222','333333'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60),
        color: Colors.transparent,
        child: VerticalTabView(
          tabsWidth: 150,
          selectedTabTextStyle: TextStyle(color: Colors.deepOrange),
          tabs: <Tab>[
            Tab(child: Text('Flutter'), icon: Icon(Icons.phone)),
            Tab(child: Text('Dart')),
            Tab(child: Text('NodeJS')),
            Tab(child: Text('PHP')),
            Tab(child: Text('HTML 5')),
            Tab(child: Text('HTML 5')),
          ],
          contents: <Widget>[
            Container(child: Text('Flutter'), padding: EdgeInsets.all(20)),
            Container(child: Text('Dart'), padding: EdgeInsets.all(20)),
            Container(child: Text('NodeJS'), padding: EdgeInsets.all(20)),
            Container(child: Text('PHP'), padding: EdgeInsets.all(20)),
            Container(child: Text('HTML 5'), padding: EdgeInsets.all(20)),
        Container(
        color: Colors.black12,
        child: ListView.builder(
            itemCount: 10,
            itemExtent: 100,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.all(10),
                color: Colors.white30,
              );
            })
    ),
          ],
        ),
      ),
    );
  }
}
