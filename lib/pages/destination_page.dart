import 'package:flutter/material.dart';
import 'package:flutter_ctrip/dao/destination_dao.dart';
import 'package:flutter_ctrip/model/destination_model.dart';
import 'package:flutter_ctrip/plugin/vertical_tab_view.dart';
import 'package:flutter_ctrip/widget/search_bar.dart';

class DestinationPage extends StatefulWidget {
  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  DestinationModel destinationModel;
  List<NavigationPopList> navigationList;
  List<Tab> tabs = [];
  List<Widget> tabPages = [];

  @override
  Widget build(BuildContext context) {
    _createTab();
    _createTabPage(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 98),
            child: VerticalTabView(
              tabsWidth: 88,
              tabsElevation: 0,
              indicatorWidth: 0,
              selectedTabBackgroundColor: Colors.white,
              backgroundColor: Colors.white,
              tabTextStyle: TextStyle(height: 60, color: Color(0xff333333),),
              tabs: tabs,
              contents: tabPages,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(8, 0, 6, 14),
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
          child: Text(model.categoryName,maxLines: 1,
            overflow: TextOverflow.ellipsis,style: TextStyle(color: Color(0xff666666),fontSize: 15,),),
        )),
      );
    });
    return tabs;
  }

  List<Widget> _createTabPage(BuildContext context) {
    if (navigationList == null) return null;
    for (int i = 0; i < navigationList.length; i++) {
      List<Widget> hots = [];
      for (var j = 0; j < navigationList[i].destAreaList.length; j++) {
        String text = navigationList[i].destAreaList[j].text;
        print(i.toString() + '--' + text);
        hots.add(
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: Text(
              text,
              style: TextStyle(fontSize: 14, color: Colors.black87),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: hots,
              ),
            ),
          ],
        ),
      ));
      print(hots);
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
