/**
 * 《Flutter从入门到进阶-实战携程网App》
 * 课程地址：
 * https://coding.imooc.com/class/321.html
 * 课程代码、文档：
 * https://git.imooc.com/coding-321/
 * 课程辅导答疑区：
 * http://coding.imooc.com/learn/qa/321.html
 */
import 'package:flutter/material.dart';
import 'package:flutter_ctrip/pages/destination_search_page.dart';
import 'package:flutter_ctrip/pages/search_page.dart';
import 'package:flutter_ctrip/pages/travel_search_page.dart';
import 'package:flutter_ctrip/plugin/asr_manager.dart';
import 'package:flutter_ctrip/util/navigator_util.dart';

///语音识别
class SpeakPage extends StatefulWidget {
  final String pageType;

  SpeakPage({this.pageType = 'home'});

  @override
  _SpeakPageState createState() => _SpeakPageState();
}

class _SpeakPageState extends State<SpeakPage>
    with SingleTickerProviderStateMixin {
  String speakTips = '长按说话';
  String speakResult = '';
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[_topItem(), _bottomItem()],
          ),
        ),
      ),
    );
  }

  _speakStart() {
    controller.forward();
    setState(() {
      speakTips = '- 识别中 -';
    });
    AsrManager.start().then((text) {
      if (text != null && text.length > 0) {
        setState(() {
          speakResult = text;
          if(speakResult.endsWith('，')) speakResult = speakResult.substring(0,speakResult.length-1);
        });
        Navigator.pop(context);
        switch (widget.pageType) {
          case 'home':
            NavigatorUtil.push(
                context,
                SearchPage(
                  keyword: speakResult,
                  hideLeft: false,
                ));
            break;
          case 'travel':
            NavigatorUtil.push(
                context,
                TravelSearchPage(
                  keyword: speakResult,
                  hideLeft: false,
                ));
            break;
          case 'destination':
            NavigatorUtil.push(
                context,
                DestinationSearchPage(
                  keyword: speakResult,
                  hideLeft: false,
                ));
            break;
        }
      }
    }).catchError((e) {
      print("----------" + e.toString());
    });
  }

  _speakStop() {
    setState(() {
      speakTips = '长按说话';
    });
    controller.reset();
    controller.stop();
    AsrManager.stop();
  }

  _topItem() {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
            child: Text('你可以这样说',
                style: TextStyle(fontSize: 16, color: Colors.black54))),
        Text('故宫门票\n北京一日游\n迪士尼乐园',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            )),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            speakResult,
            style: TextStyle(color: Colors.blue),
          ),
        )
      ],
    );
  }

  _bottomItem() {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTapDown: (e) {
              _speakStart();
            },
            onTapUp: (e) {
              _speakStop();
            },
            onTapCancel: () {
              _speakStop();
            },
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      speakTips,
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        //占坑，避免动画执行过程中导致父布局大小变得
                        height: MIC_SIZE,
                        width: MIC_SIZE,
                      ),
                      Center(
                        child: AnimatedMic(
                          animation: animation,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                size: 30,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}

const double MIC_SIZE = 80;

class AnimatedMic extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 1, end: 0.5);
  static final _sizeTween = Tween<double>(begin: MIC_SIZE, end: MIC_SIZE - 20);

  AnimatedMic({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Container(
        height: _sizeTween.evaluate(animation),
        width: _sizeTween.evaluate(animation),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(MIC_SIZE / 2),
        ),
        child: Icon(
          Icons.mic,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
