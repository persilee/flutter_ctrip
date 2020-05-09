import 'package:flutter/material.dart';
import 'package:flutter_ctrip/util/navigator_util.dart';
import 'package:flutter_ctrip/widget/webview.dart';

class GridNavNew extends StatefulWidget {
  @override
  _GridNavNewState createState() => _GridNavNewState();
}

class _GridNavNewState extends State<GridNavNew> {
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              height: 72,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xfffa5956),
                  Color(0xffef9c76).withAlpha(45)
                ]),
              ),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      NavigatorUtil.push(context, WebView(
                        url: 'https://m.ctrip.com/webapp/hotel/?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
                        hideAppBar: true,
                      ));
                    },
                    child: Container(
                      width: 110,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: <Widget>[
                          Image.asset(
                            'images/grid-nav-items-hotel.png',
                            width: 70,
                            fit: BoxFit.contain,
                            alignment: AlignmentDirectional.bottomEnd,
                          ),
                          Container(
                            alignment: AlignmentDirectional.centerStart,
                            margin: EdgeInsets.only(left: 16),
                            child: Text(
                              '酒店',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        NavigatorUtil.push(context, WebView(
                          url: 'https://m.ctrip.com/webapp/inn-v2/home?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
                          hideAppBar: true,
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                            color: Colors.white,
                            width: 1,
                          )),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: <Widget>[
                            Image.asset(
                              'images/grid-nav-items-minsu.png',
                              width: 32,
                              fit: BoxFit.contain,
                              alignment: AlignmentDirectional.bottomStart,
                            ),
                            Container(
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                '民宿·客栈',
                                style: TextStyle(fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: (){
                        NavigatorUtil.push(context, WebView(
                          url: 'https://m.ctrip.com/webapp/vacations/idiytour/newindex?sourcefrom=h5_xingongge&title=%E6%9C%BA%E7%A5%A8%E3%83%BB%E7%81%AB%E8%BD%A6%E7%A5%A8%2B%E9%85%92%E5%BA%97&isHideNavBar=YES&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
                          hideAppBar: true,
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xffffbc49), Color(0xffffd252)]),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: <Widget>[
                            Image.asset(
                              'images/grid-nav-items-jhj.png',
                              width: 90,
                              fit: BoxFit.contain,
                              alignment: AlignmentDirectional.bottomEnd,
                            ),
                            Container(
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                '机票/火车票+酒店',
                                style: TextStyle(fontSize: 14, color: Color(0xffa05416)),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 24,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                decoration: BoxDecoration(
                                  color: Color(0xfff54c45),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(5),
                                  )
                                ),
                                child: Text(
                                  '方便又便宜',
                                  style: TextStyle(fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1),
            ),
            Container(
              height: 72,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xff4b8fed),
                  Color(0xff53bced),
                ]),
              ),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      NavigatorUtil.push(context, WebView(
                        url: 'https://m.ctrip.com/html5/flight/swift/index?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
                        hideAppBar: false,
                        title: '机票',
                      ));
                    },
                    child: Container(
                      width: 110,
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: <Widget>[
                          Image.asset(
                            'images/grid-nav-items-flight.png',
                            width: 70,
                            fit: BoxFit.contain,
                            alignment: AlignmentDirectional.bottomEnd,
                          ),
                          Container(
                            alignment: AlignmentDirectional.centerStart,
                            margin: EdgeInsets.only(left: 16),
                            child: Text(
                              '机票',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        NavigatorUtil.push(context, WebView(
                          url: 'https://m.ctrip.com/webapp/train/?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F#/index?VNK=5661dfc9',
                          hideAppBar: true,
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                            color: Colors.white,
                            width: 1,
                          )),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: <Widget>[
                            Image.asset(
                              'images/grid-nav-items-train.png',
                              width: 32,
                              fit: BoxFit.contain,
                              alignment: AlignmentDirectional.bottomStart,
                            ),
                            Container(
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                '火车票',
                                style: TextStyle(fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        NavigatorUtil.push(context, WebView(
                          url: 'https://m.ctrip.com/webapp/bus/?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
                          hideAppBar: true,
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                            color: Colors.white,
                            width: 1,
                          )),
                        ),
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            '汽车·船票',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        NavigatorUtil.push(context, WebView(
                          url: 'https://m.ctrip.com/webapp/cw/car/home/index.html',
                          hideAppBar: false,
                          title: '专车·租车',
                        ));
                      },
                      child: Container(
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            '专车·租车',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1),
            ),
            Container(
              height: 72,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xff34c2aa),
                  Color(0xff6cd557),
                ]),
              ),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      NavigatorUtil.push(context, WebView(
                        url: 'https://m.ctrip.com/webapp/vacations/tour/vacations?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
                        hideAppBar: true,
                      ));
                    },
                    child: Container(
                      width: 110,
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                              color: Colors.white,
                              width: 1,
                            )),
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: <Widget>[
                          Image.asset(
                            'images/grid-nav-items-travel.png',
                            width: 80,
                            fit: BoxFit.contain,
                            alignment: AlignmentDirectional.bottomEnd,
                          ),
                          Container(
                            alignment: AlignmentDirectional.centerStart,
                            margin: EdgeInsets.only(left: 16),
                            child: Text(
                              '旅游',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        NavigatorUtil.push(context, WebView(
                          url: 'https://m.ctrip.com/webapp/train/crh/plan/crhList.html?from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
                          hideAppBar: false,
                          title: '高铁游',
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                color: Colors.white,
                                width: 1,
                              )),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: <Widget>[
                            Image.asset(
                              'images/grid-nav-items-dingzhi.png',
                              width: 40,
                              fit: BoxFit.contain,
                              alignment: AlignmentDirectional.bottomStart,
                            ),
                            Container(
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                '高铁游',
                                style: TextStyle(fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        NavigatorUtil.push(context, WebView(
                          url: 'https://m.ctrip.com/webapp/cruise/index?ctm_ref=C_vac_cruise&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
                          hideAppBar: true,
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                color: Colors.white,
                                width: 1,
                              )),
                        ),
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            '游轮游',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        NavigatorUtil.push(context, WebView(
                          url: 'https://m.ctrip.com/webapp/dingzhi/index?ctm_ref=C_vac_custom&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
                          hideAppBar: true,
                        ));
                      },
                      child: Container(
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            '定制游',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
