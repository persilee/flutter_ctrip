import 'package:flutter/material.dart';
import 'package:flutter_ctrip/dao/trave_hot_keyword_dao.dart';
import 'package:flutter_ctrip/dao/travel_params_dao.dart';
import 'package:flutter_ctrip/dao/travel_tab_dao.dart';
import 'package:flutter_ctrip/model/travel_hot_keyword_model.dart';
import 'package:flutter_ctrip/model/travel_params_model.dart';
import 'package:flutter_ctrip/model/travel_tab_model.dart';
import 'package:flutter_ctrip/pages/speak_page.dart';
import 'package:flutter_ctrip/pages/travel_search_page.dart';
import 'package:flutter_ctrip/pages/travel_tab_page.dart';
import 'package:flutter_ctrip/util/navigator_util.dart';
import 'package:flutter_ctrip/widget/search_bar.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  TabController _controller;
  List<Groups> tabs = [];
  TravelTabModel travelTabModel;
  TravelParamsModel travelParamsModel;
  TravelHotKeywordModel travelHotKeywordModel;
  List<HotKeyword> hotKeyWords;
  String defaultText = '试试搜\“花式过五一\”';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(8, 8, 6, 0),
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: SafeArea(
              child: SearchBar(
                searchBarType: SearchBarType.homeLight,
                inputBoxClick: _jumpToSearch,
                defaultText: defaultText,
                speakClick: _jumpToSpeak,
                hintList: hotKeyWords,
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 2),
            child: TabBar(
              controller: _controller,
              isScrollable: true,
              labelColor: Colors.black,
              labelPadding: EdgeInsets.fromLTRB(8, 6, 8, 0),
              indicatorColor: Color(0xff2FCFBB),
              indicatorPadding: EdgeInsets.all(6),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2.2,
              labelStyle: TextStyle(fontSize: 18),
              unselectedLabelStyle: TextStyle(fontSize: 15),
              tabs: tabs.map<Tab>((Groups tab) {
                return Tab(
                  text: tab.name,
                );
              }).toList(),
            ),
          ),
          Flexible(
              child: Container(
            padding: EdgeInsets.fromLTRB(6, 3, 6, 0),
            child: TabBarView(
                controller: _controller,
                children: tabs.map((Groups tab) {
                  return TravelTabPage(
                    travelUrl: travelParamsModel?.url,
                    params: travelParamsModel?.params,
                    groupChannelCode: tab?.code,
                  );
                }).toList()),
          )),
        ],
      ),
    );
  }

  @override
  void initState() {
    _controller = TabController(length: 0, vsync: this);
    _loadParams();
    _loadHotKeyword();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _jumpToSpeak() {
    NavigatorUtil.push(context, SpeakPage(pageType: 'travel',));
  }

  void _jumpToSearch() {
    NavigatorUtil.push(
      context,
      TravelSearchPage(
        hint: defaultText,
        hideLeft: false,
      ),
    );
  }

  void _loadParams() {
    TravelParamsDao.fetch().then((TravelParamsModel model) {
      setState(() {
        travelParamsModel = model;
      });
      _loadTab();
    }).catchError((e) {
      print(e);
    });
  }

  void _loadTab(){
    TravelTabDao.fetch().then((TravelTabModel model) {
      _controller = TabController(
          length: model.district.groups.length,
          vsync: this); //fix tab label 空白问题
      setState(() {
        tabs = model.district.groups;
        travelTabModel = model;
      });
    }).catchError((e) {
      print(e);
    });
  }

  void _loadHotKeyword() {
    TravelHotKeywordDao.fetch().then((TravelHotKeywordModel model){
      setState(() {
        travelHotKeywordModel = model;
        hotKeyWords = travelHotKeywordModel.hotKeyword;
      });
    }).catchError((e) => print(e));
  }
}
