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
    with SingleTickerProviderStateMixin, TickerProviderStateMixin {
  String speakTips = '长按说话';
  String speakResult = '';
  bool isUnResult = true;
  bool isStart = false;
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInCubic)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
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
        padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              isStart ? _startTip() :
              isUnResult ? _topItem() : _topTip(),
              _bottomItem()],
          ),
        ),
      ),
    );
  }

  _speakStart() {
    controller.forward();
    setState(() {
      speakTips = '松开完成';
      isStart = true;
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
      }else{
        print(text + '-----------------------------');
        setState(() {
          isUnResult = false;
        });
      }
    }).catchError((e) {
      setState(() {
        isUnResult = false;
      });
      print("----------" + e.toString());
    });
  }

  _speakStop() {
    setState(() {
      speakTips = '长按说话';
      isStart = false;
    });
    controller.reset();
    controller.stop();
    AsrManager.stop();
  }
  _startTip() {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 10),),
        Image.network('https://images3.c-ctrip.com/marketing/2015/07/coupon_new_h5/dlp_awk.png',height: 80,width: 80,),
        Padding(padding: EdgeInsets.only(top: 10),),
        Text('正在听您说...', style: TextStyle(fontSize: 16, color: Colors.black.withAlpha(180),letterSpacing: 1.2)),
      ],
    );
  }
  _topTip(){
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 10),),
        Image.network('https://images3.c-ctrip.com/marketing/2015/07/coupon_new_h5/dlp_awk.png',height: 80,width: 80,),
        Padding(padding: EdgeInsets.only(top: 10),),
        Text('你好像没有说话', style: TextStyle(fontSize: 16, color: Colors.black.withAlpha(180),letterSpacing: 1.2)),
        Padding(padding: EdgeInsets.only(top: 8),),
        Text('请按住话筒重新开始', style: TextStyle(fontSize: 14, color: Colors.black.withAlpha(100),letterSpacing: 1.2)),
      ],
    );
  }

  _topItem() {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
            child: Text('你可以这样说',
                style: TextStyle(fontSize: 16, color: Colors.black.withAlpha(180)))),
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
    return Stack(
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    speakTips,
                    style: TextStyle(color: Colors.blue, fontSize: 12),
                  ),
                  AnimatedWear(
                    animation: animation,
                    isStart: isStart,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 26,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              size: 26,
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}

class AnimatedWear extends AnimatedWidget {
  final bool isStart;
  static final _opacityTween = Tween<double>(begin: 0.5, end: 0);
  static final _sizeTween = Tween<double>(begin: 90, end: 260);
  AnimatedWear({Key key,this.isStart, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      height: 90,
      width: 90,
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.center,
        children: <Widget>[
          isStart ? Container(
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(30),
              borderRadius: BorderRadius.circular(45),
            ),
          ) : Container(),
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Icon(
              Icons.mic,
              color: Colors.white,
              size: 30,
            ),
          ),
          Positioned(
            left: -((_sizeTween.evaluate(animation) - 90) / 2), //45
            top: -((_sizeTween.evaluate(animation) - 90) / 2), //45,
            child: Opacity(
              opacity: _opacityTween.evaluate(animation),
              child: Container(
                width: isStart ? _sizeTween.evaluate(animation) : 0,
                height: _sizeTween.evaluate(animation),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(_sizeTween.evaluate(animation) / 2),
                    border: Border.all(color: Color(0xa8000000),)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
