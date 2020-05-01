import 'package:flutter/material.dart';
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
        margin: EdgeInsets.only(top: 200),
        width: 100,
        height: 20,
        color: Colors.transparent,
        child: Swiper(
          scrollDirection: Axis.vertical,
          itemCount: s.length,
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return Text(s[index]);
          },
        ),
      ),
    );
  }
}
