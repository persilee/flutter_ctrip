import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_ctrip/plugin/side_page_view.dart';
import 'package:flutter_ctrip/plugin/vertical_tab_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:page_view_indicators/linear_progress_page_indicator.dart';
import 'dart:math' as math;

import 'package:scroll_to_index/scroll_to_index.dart';

class TestPage extends StatefulWidget {
  final String title;

  TestPage({Key key, this.title}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final _items = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.pink,
    Colors.red,
    Colors.amber,
    Colors.brown,
    Colors.yellow,
    Colors.blue,
  ];
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _boxHeight = 300.0;
  ScrollController _controller = ScrollController();
  bool showToTopBtn = false;
  OverlayEntry sticky;
  GlobalKey stickyKey = GlobalKey();
  static const maxCount = 100;
  final random = math.Random();
  final scrollDirection = Axis.vertical;
  double viewH;
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 60),
            height: 200,
            child: ListView.builder(
              controller: _controller,
              key: stickyKey,
              scrollDirection: Axis.horizontal,
              itemCount: 50,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 1.0),
                  color: Colors.tealAccent,
                  child: Text('$index'),
                );
              },
            ),
          ),
          Container(
              height: 8,
              width: 120,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha(100),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: viewH,
                    child: Container(
                      width: 20,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ],
              )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToIndex,
        tooltip: 'Increment',
        child: Text('ah'),
      ),
    );
  }
  void _scrollToIndex() {
    final keyContext = stickyKey.currentContext;
    final box = keyContext.findRenderObject() as RenderBox;
    print(box.size);
  }

  Widget stickyBuilder(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_,Widget child) {
        final keyContext = stickyKey.currentContext;
        if (keyContext != null) {
          // widget is visible
          final box = keyContext.findRenderObject() as RenderBox;
          print(box.size);
          final pos = box.localToGlobal(Offset.zero);
          return Positioned(
            top: pos.dy + box.size.height,
            left: 50.0,
            right: 50.0,
            height: box.size.height,
            child: Material(
              child: Container(
                alignment: Alignment.center,
                color: Colors.purple,
                child: const Text("^ Nah I think you're okay"),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _pageViewTest () {
    return   SidePageView(
      children: [
        Column(
            children: [
              Container(height: 200, color: Colors.green),
            ]
        ),
        Column(
            children: [
              Container(height: 200, color: Colors.red),
            ]
        ),
      ],
      titleChildren: [
        Text('Green'),
        Text('Red'),
      ],
    );
  }

  @override
  void dispose() {
    sticky.remove();
    super.dispose();
  }

  @override
  void initState() {
    _controller.addListener((){
      print(_controller.position.maxScrollExtent.toString() + 'max');
      print(((_controller.position.pixels / _controller.position.maxScrollExtent) *100).toInt());
      setState(() {
        viewH = ((_controller.position.pixels / _controller.position.maxScrollExtent) *100).toDouble();
      });
    });
    super.initState();
  }
}