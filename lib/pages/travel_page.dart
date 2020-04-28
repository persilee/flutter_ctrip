import 'package:flutter/material.dart';
import 'package:flutter_ctrip/dao/travel_params_dao.dart';
import 'package:flutter_ctrip/dao/travel_tab_dao.dart';
import 'package:flutter_ctrip/model/travel_params_model.dart';
import 'package:flutter_ctrip/model/travel_tab_model.dart';
import 'package:flutter_ctrip/pages/travel_tab_page.dart';

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
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(2, 30, 0, 0),
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
                    travelUrl: travelParamsModel.url,
                    params: travelParamsModel.params,
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
    _loadParams();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
