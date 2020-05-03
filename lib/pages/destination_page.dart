import 'package:flutter/material.dart';
import 'package:flutter_ctrip/dao/destination_dao.dart';
import 'package:flutter_ctrip/model/destination_model.dart';
import 'package:flutter_ctrip/plugin/vertical_tab_view.dart';
import 'package:flutter_ctrip/widget/search_bar.dart';
import 'package:flutter_ctrip/widget/loading_container.dart';

class DestinationPage extends StatefulWidget {
  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  DestinationModel destinationModel;
  List<NavigationPopList> navigationList;
  List<Tab> tabs = [];
  List<Widget> tabPages = [];

  bool _isLoading = true;

  bool _isMore = true;

  @override
  Widget build(BuildContext context) {
    _createTab();
    _createTabPage(context);
    if (tabs.length > 0 && tabPages.length > 0) {
      setState(() {
        _isLoading = false;
      });
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoadingContainer(
        isLoading: _isLoading,
        child: Stack(
          children: <Widget>[
//            Container(
//              margin: EdgeInsets.only(top: 90),
//              child: VerticalTabView(
//                tabsWidth: 88,
//                tabsElevation: 0,
//                indicatorWidth: 0,
//                selectedTabBackgroundColor: Colors.white,
//                backgroundColor: Colors.white,
//                tabTextStyle: TextStyle(
//                  height: 60,
//                  color: Color(0xff333333),
//                ),
//                tabs: tabs,
//                contents: tabPages,
//              ),
//            ),

            Container(
              margin: EdgeInsets.only(top: 98),
              child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.grey,
                    width: 88,
                  ),
                  Expanded(
                    flex: 1,
                    child: MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.only(right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                                  child: Text(
                                    '当季热门',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 8, 0, 0),
                                            child: Column(
                                              children: <Widget>[
                                                PhysicalModel(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  clipBehavior: Clip.antiAlias,
                                                  color: Colors.transparent,
                                                  elevation: 5,
                                                  child: Container(
                                                    child: Image.network(
                                                      'https://dimg02.c-ctrip.com/images/100110000000qfs9mE3E1_C_250_250.jpg',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 4, 0, 4),
                                                  child: Text(
                                                    '日本',
                                                    style: TextStyle(
                                                        color: Color(0xff333333)
                                                            .withAlpha(200)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 8, 0, 0),
                                            child: Column(
                                              children: <Widget>[
                                                PhysicalModel(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  clipBehavior: Clip.antiAlias,
                                                  color: Colors.transparent,
                                                  elevation: 5,
                                                  child: Container(
                                                    child: Image.network(
                                                      'https://dimg02.c-ctrip.com/images/100110000000qfs9mE3E1_C_250_250.jpg',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 4, 0, 4),
                                                  child: Text(
                                                    '日本',
                                                    style: TextStyle(
                                                        color: Color(0xff333333)
                                                            .withAlpha(200)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 8, 0, 0),
                                            child: Column(
                                              children: <Widget>[
                                                PhysicalModel(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  clipBehavior: Clip.antiAlias,
                                                  color: Colors.transparent,
                                                  elevation: 5,
                                                  child: Container(
                                                    child: Image.network(
                                                      'https://dimg02.c-ctrip.com/images/100110000000qfs9mE3E1_C_250_250.jpg',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 4, 0, 4),
                                                  child: Text(
                                                    '日本',
                                                    style: TextStyle(
                                                        color: Color(0xff333333)
                                                            .withAlpha(200)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 8, 0, 0),
                                            child: Column(
                                              children: <Widget>[
                                                PhysicalModel(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  clipBehavior: Clip.antiAlias,
                                                  color: Colors.transparent,
                                                  elevation: 5,
                                                  child: Container(
                                                    child: Image.network(
                                                      'https://dimg02.c-ctrip.com/images/100110000000qfs9mE3E1_C_250_250.jpg',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 4, 0, 4),
                                                  child: Text(
                                                    '日本',
                                                    style: TextStyle(
                                                        color: Color(0xff333333)
                                                            .withAlpha(200)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 8, 0, 0),
                                            child: Column(
                                              children: <Widget>[
                                                PhysicalModel(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  clipBehavior: Clip.antiAlias,
                                                  color: Colors.transparent,
                                                  elevation: 5,
                                                  child: Container(
                                                    child: Image.network(
                                                      'https://dimg02.c-ctrip.com/images/100110000000qfs9mE3E1_C_250_250.jpg',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 4, 0, 4),
                                                  child: Text(
                                                    '日本',
                                                    style: TextStyle(
                                                        color: Color(0xff333333)
                                                            .withAlpha(200)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 8, 0, 0),
                                            child: Column(
                                              children: <Widget>[
                                                PhysicalModel(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  clipBehavior: Clip.antiAlias,
                                                  color: Colors.transparent,
                                                  elevation: 5,
                                                  child: Container(
                                                    child: Image.network(
                                                      'https://dimg02.c-ctrip.com/images/100110000000qfs9mE3E1_C_250_250.jpg',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 4, 0, 4),
                                                  child: Text(
                                                    '日本',
                                                    style: TextStyle(
                                                        color: Color(0xff333333)
                                                            .withAlpha(200)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                                  child: Text(
                                    '周边经典目的地',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 10, 10),
                                              decoration: BoxDecoration(
                                                  color: Color(0xfff8f8f8),
                                                  borderRadius:
                                                  BorderRadius.circular(4),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withAlpha(30),
                                                        offset: Offset(1, 1),
                                                        spreadRadius: 1,
                                                        blurRadius: 3),
                                                  ]),
                                              height: 36,
                                              child: Text(
                                                '扬州',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff333333)
                                                        .withAlpha(220),
                                                    fontSize: 13),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 10, 10),
                                              decoration: BoxDecoration(
                                                  color: Color(0xfff8f8f8),
                                                  borderRadius:
                                                  BorderRadius.circular(4),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withAlpha(20),
                                                        offset: Offset(0, 0),
                                                        spreadRadius: 1,
                                                        blurRadius: 2),
                                                  ]),
                                              height: 36,
                                              child: Text(
                                                '天目湖涵田半山温泉',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff333333)
                                                        .withAlpha(220),
                                                    fontSize: 13),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 10, 10),
                                              decoration: BoxDecoration(
                                                  color: Color(0xfff8f8f8),
                                                  borderRadius:
                                                  BorderRadius.circular(4),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withAlpha(30),
                                                        offset: Offset(1, 1),
                                                        spreadRadius: 1,
                                                        blurRadius: 3),
                                                  ]),
                                              height: 36,
                                              child: Text(
                                                '舟山',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff333333)
                                                        .withAlpha(220),
                                                    fontSize: 13),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 10, 10),
                                              decoration: BoxDecoration(
                                                  color: Color(0xfff8f8f8),
                                                  borderRadius:
                                                  BorderRadius.circular(4),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withAlpha(30),
                                                        offset: Offset(1, 1),
                                                        spreadRadius: 1,
                                                        blurRadius: 3),
                                                  ]),
                                              height: 36,
                                              child: Text(
                                                '扬州',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff333333)
                                                        .withAlpha(220),
                                                    fontSize: 13),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 10, 10),
                                              decoration: BoxDecoration(
                                                  color: Color(0xfff8f8f8),
                                                  borderRadius:
                                                  BorderRadius.circular(4),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withAlpha(20),
                                                        offset: Offset(0, 0),
                                                        spreadRadius: 1,
                                                        blurRadius: 2),
                                                  ]),
                                              height: 36,
                                              child: Text(
                                                '天目湖涵田半山温泉',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff333333)
                                                        .withAlpha(220),
                                                    fontSize: 13),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 10, 10),
                                              decoration: BoxDecoration(
                                                  color: Color(0xfff8f8f8),
                                                  borderRadius:
                                                  BorderRadius.circular(4),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withAlpha(30),
                                                        offset: Offset(1, 1),
                                                        spreadRadius: 1,
                                                        blurRadius: 3),
                                                  ]),
                                              height: 36,
                                              child: Text(
                                                '舟山',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff333333)
                                                        .withAlpha(220),
                                                    fontSize: 13),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 10, 10),
                                              decoration: BoxDecoration(
                                                  color: Color(0xfff8f8f8),
                                                  borderRadius:
                                                  BorderRadius.circular(4),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withAlpha(30),
                                                        offset: Offset(1, 1),
                                                        spreadRadius: 1,
                                                        blurRadius: 3),
                                                  ]),
                                              height: 36,
                                              child: Text(
                                                '扬州',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff333333)
                                                        .withAlpha(220),
                                                    fontSize: 13),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 10, 10),
                                              decoration: BoxDecoration(
                                                  color: Color(0xfff8f8f8),
                                                  borderRadius:
                                                  BorderRadius.circular(4),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withAlpha(20),
                                                        offset: Offset(0, 0),
                                                        spreadRadius: 1,
                                                        blurRadius: 2),
                                                  ]),
                                              height: 36,
                                              child: Text(
                                                '天目湖涵田半山温泉',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff333333)
                                                        .withAlpha(220),
                                                    fontSize: 13),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 10, 10),
                                              decoration: BoxDecoration(
                                                  color: Color(0xfff8f8f8),
                                                  borderRadius:
                                                  BorderRadius.circular(4),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withAlpha(30),
                                                        offset: Offset(1, 1),
                                                        spreadRadius: 1,
                                                        blurRadius: 3),
                                                  ]),
                                              height: 36,
                                              child: Text(
                                                '舟山',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff333333)
                                                        .withAlpha(220),
                                                    fontSize: 13),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Offstage(
                                        offstage: _isMore,
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.fromLTRB(
                                                        0, 0, 10, 10),
                                                    decoration: BoxDecoration(
                                                        color: Color(0xfff8f8f8),
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors.black
                                                                  .withAlpha(30),
                                                              offset: Offset(1, 1),
                                                              spreadRadius: 1,
                                                              blurRadius: 3),
                                                        ]),
                                                    height: 36,
                                                    child: Text(
                                                      '横店影视城',
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Color(0xff333333)
                                                              .withAlpha(220),
                                                          fontSize: 13),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(),
                                                ),
                                                Expanded(
                                                  child: Container(),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _isMore = !_isMore;
                                            });
                                          },
                                          child: _isMore
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      '展开',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontFamily: ''),
                                                    ),
                                                    Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: Colors.blue,
                                                      size: 16,
                                                    ),
                                                  ],
                                                )
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      '收起',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontFamily: ''),
                                                    ),
                                                    Icon(
                                                      Icons.keyboard_arrow_up,
                                                      color: Colors.blue,
                                                      size: 16,
                                                    ),
                                                  ],
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(8, 10, 6, 14),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(10, 0, 0, 0),
                    blurRadius: 6,
                    spreadRadius: 1,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: SafeArea(
                child: SearchBar(
                  searchBarType: SearchBarType.homeLight,
                  inputBoxClick: _jumpToSearch,
                  defaultText: '',
                  speakClick: _jumpToSpeak,
                  rightButtonClick: _jumpToUser,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Tab> _createTab() {
    if (navigationList == null) return null;
    navigationList.forEach((model) {
      tabs.add(
        Tab(
            child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Text(
            model.categoryName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xff666666),
              fontSize: 15,
            ),
          ),
        )),
      );
    });
    return tabs;
  }

  List<Widget> _createTabPage(BuildContext context) {
    if (navigationList == null) return null;
    for (int i = 0; i < navigationList.length; i++) {
      List<Widget> tabPage = [];
      for (var j = 0; j < navigationList[i].destAreaList.length; j++) {
        String text = navigationList[i].destAreaList[j].text;
        tabPage.add(
          ///标题
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: Text(
              text,
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        );
        List<Widget> imageItems = [];
        List<Widget> spanContent = [];
        List<Widget> visibleSpans = [];
        List<Widget> unVisibleSpans = [];
        for (var k = 0;
            k < navigationList[i].destAreaList[j].child.length;
            k++) {
          ///图片
          if (navigationList[i].destAreaList[j].child[k].picUrl != '' &&
              navigationList[i].destAreaList[j].child[k].picUrl != null) {
            imageItems.add(
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                  child: Column(
                    children: <Widget>[
                      PhysicalModel(
                        borderRadius: BorderRadius.circular(6),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.transparent,
                        elevation: 5,
                        child: Container(
                          child: Image.network(
                            navigationList[i].destAreaList[j].child[k].picUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                        child: Text(
                          navigationList[i].destAreaList[j].child[k].text,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style:
                              TextStyle(color: Color(0xff333333).withAlpha(220)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            ///标签
            //当标签数量小于9个时，放到可以显示的容器
            if (k < 9) {
              visibleSpans.add(
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
                  decoration: BoxDecoration(
                      color: Color(0xfff8f8f8),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withAlpha(30),
                            offset: Offset(1, 1),
                            spreadRadius: 1,
                            blurRadius: 3),
                      ]),
                  width: 80,
                  height: 36,
                  child: Text(
                    navigationList[i].destAreaList[j].child[k].text,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff333333).withAlpha(220), fontSize: 13),
                  ),
                ),
              );
            } else if (k >= 9) {
              unVisibleSpans.add(
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
                  decoration: BoxDecoration(
                      color: Color(0xfff8f8f8),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withAlpha(30),
                            offset: Offset(1, 1),
                            spreadRadius: 1,
                            blurRadius: 3),
                      ]),
                  width: 80,
                  height: 36,
                  child: Text(
                    navigationList[i].destAreaList[j].child[k].text,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff333333).withAlpha(220), fontSize: 13),
                  ),
                ),
              );
            }
          }
        }
        if (visibleSpans.length > 0) {
          spanContent.add(
            Wrap(
              children: visibleSpans,
            ),
          );
        }
        if (unVisibleSpans.length > 0) {
          spanContent.add(Offstage(
            offstage: _isMore,
            child: Wrap(
              children: unVisibleSpans,
            ),
          ));
          spanContent.add(
            Container(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isMore = !_isMore;
                  });
                },
                child: _isMore
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '展开',
                            style:
                                TextStyle(color: Colors.blue, fontFamily: ''),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.blue,
                            size: 16,
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '收起',
                            style:
                                TextStyle(color: Colors.blue, fontFamily: ''),
                          ),
                          Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.blue,
                            size: 16,
                          ),
                        ],
                      ),
              ),
            ),
          );
        }
        // 处理数据 每3条数据放到一个row容器
        List<Widget> rowList = [];
        int start = 0;
        for (var k = 0; k < imageItems.length; k++) {
          if(k % 3 == 0 && k != 0){
            rowList.add(Row(
              children: imageItems.sublist(start,k),
            ),);
            start = k;
          }else if(k == imageItems.length -1 && imageItems.length % 3 == 0){
            rowList.add(Row(
              children: imageItems.sublist(start,imageItems.length),
            ),);
          }else if(start+3 >= imageItems.length){
            rowList.add(Row(
              children: imageItems.sublist(start,imageItems.length)
            ),);
          }

        }
        tabPage.add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rowList,
          ),
        );
        tabPage.add(
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: spanContent,
            ),
          ),
        );
      }
      tabPages.add(MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.fromLTRB(2, 0, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: tabPage,
              ),
            ),
          ],
        ),
      ));
    }
    setState(() {});
  }

  void _jumpToSearch() {}

  void _jumpToSpeak() {}

  void _jumpToUser() {}

  void _loadData() {
    DestinationDao.fetch().then((DestinationModel model) {
      setState(() {
        destinationModel = model;
        navigationList = destinationModel.navigationPopList;
      });
    }).catchError((e) => print(e));
  }
}
