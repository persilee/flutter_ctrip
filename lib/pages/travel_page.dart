import 'package:flutter/material.dart';
import 'package:flutter_ctrip/dao/travel_params_dao.dart';
import 'package:flutter_ctrip/dao/travel_tab_dao.dart';
import 'package:flutter_ctrip/model/travel_params_model.dart';
import 'package:flutter_ctrip/model/travel_tab_model.dart';
import 'package:flutter_ctrip/pages/search_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(8, 0, 6, 0),
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: SafeArea(
              child: SearchBar(
                searchBarType: SearchBarType.homeLight,
                inputBoxClick: _jumpToSearch,
                defaultText: '',
                leftButtonClick: () {},
                speakClick: () {},
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
              labelPadding: EdgeInsets.fromLTRB(8, 8, 8, 0),
//              unselectedLabelColor: Color(0xff2FCFBB),
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
                    groupChannelCode: tab.code,
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
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _jumpToSearch() {
    NavigatorUtil.push(
      context,
      TravelSearchPage(
        hint: '',
        hideLeft: false,
      ),
    );
  }

  void _loadParams() {
    TravelParamsDao.fetch().then((TravelParamsModel model) {
      setState(() {
        travelParamsModel = model;
      });
    }).catchError((e) {
      print(e);
    });
  }
}
