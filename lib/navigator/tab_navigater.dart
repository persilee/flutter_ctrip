import 'package:flutter/material.dart';
import 'package:flutter_ctrip/pages/destination_page.dart';
import 'package:flutter_ctrip/pages/home_page.dart';
import 'package:flutter_ctrip/pages/my_page.dart';
import 'package:flutter_ctrip/pages/test_page.dart';
import 'package:flutter_ctrip/pages/travel_page.dart';
import 'package:flutter_ctrip/widget/scalable_box.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Color(0xff8a8a8a);
  final _activeColor = Color(0xff50b4ed);
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          DestinationPage(),
          TravelPage(),
          MyPage(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('images/xiecheng.png',width: 22,height: 22,),
              activeIcon: Image.asset('images/xiecheng_active.png',width: 22,height: 22,),
              title: Text(
                '首页',
                style: TextStyle(
                  color: _currentIndex != 0 ? _defaultColor : _activeColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/mude.png',width: 24,height: 24,),
              activeIcon: Image.asset('images/mude_active.png',width: 24,height: 24,),
              title: Text(
                '目的地',
                style: TextStyle(
                  color: _currentIndex != 1 ? _defaultColor : _activeColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/lvpai.png',width: 23,height: 23,),
              activeIcon: Image.asset('images/lvpai_active.png',width: 23,height: 23,),
              title: Text(
                '旅拍',
                style: TextStyle(
                  color: _currentIndex != 2 ? _defaultColor : _activeColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/wode.png',width: 23,height: 23,),
              activeIcon: Image.asset('images/wode_active.png',width: 23,height: 23,),
              title: Text(
                '我的',
                style: TextStyle(
                  color: _currentIndex != 3 ? _defaultColor : _activeColor,
                ),
              ),
            ),
          ]),
    );
  }
}
