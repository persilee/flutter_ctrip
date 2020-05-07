import 'package:flutter/material.dart';
import 'package:flutter_ctrip/dao/destination_search_dao.dart';
import 'package:flutter_ctrip/dao/search_dao.dart';
import 'package:flutter_ctrip/model/destination_search_model.dart';
import 'package:flutter_ctrip/model/seach_model.dart';
import 'package:flutter_ctrip/pages/speak_page.dart';
import 'package:flutter_ctrip/util/navigator_util.dart';
import 'package:flutter_ctrip/widget/search_bar.dart';
import 'package:flutter_ctrip/widget/webview.dart';

const TYPES = [
  'D',
  'SS',
];
const URL =
    'https://sec-m.ctrip.com/restapi/soa2/13558/mobileSuggestV2?_fxpcqlniredt=09031043410934928682';

class DestinationSearchPage extends StatefulWidget {
  final bool hideLeft;
  final String searchUrl;
  final String keyword;
  final String hint;

  DestinationSearchPage(
      {this.hideLeft = true, this.searchUrl = URL, this.keyword, this.hint});

  @override
  _DestinationSearchPageState createState() => _DestinationSearchPageState();
}

class _DestinationSearchPageState extends State<DestinationSearchPage> {
  DestinationSearchModel destinationSearchModel;
  InputInfoType inputInfoType;
  SuggestTabType suggestTabType;
  SuggestHotDistrictType suggestHotDistrictType;
  SuggestPoiType suggestPoiType;
  SuggestRecommendType suggestRecommendType;
  SuggestPreferType suggestPreferType;
  String keyword;
  int itemsL = 0;
  List<Widget> items = [];

  @override
  void initState() {
    if (widget.keyword != null) {
      _onTextChange(widget.keyword);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _appBar(),
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: Expanded(
              flex: 1,
              child: ListView(
                children: items.length > 0 ? items : [],
              ),
            ),
          )
        ],
      ),
    );
  }

  _appBar() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
              padding: EdgeInsets.only(top: 30),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(2, 3),
                    blurRadius: 6,
                    spreadRadius: 0.6,
                  ),
                ],
              ),
              child: SearchBar(
                hideLeft: widget.hideLeft,
                defaultText: widget.keyword,
                hint: widget.hint,
                leftButtonClick: () {
                  Navigator.pop(context);
                },
                onChanged: _onTextChange,
                speakClick: _jumpToSpeak,
              )),
        )
      ],
    );
  }

  _jumpToSpeak() {
    NavigatorUtil.push(
        context,
        SpeakPage(
          pageType: 'destination',
        ));
  }

  List<Widget> _createContent() {
    List<Widget> _contents = [];
    if (destinationSearchModel.inputInfoType != null) {
      PoiInfoType item = destinationSearchModel.inputInfoType.poiInfoType;
      _contents.add(_createPoiInfo(item.searchName, item.poid, item.upperName, item.dataType));
    }
    if (destinationSearchModel.suggestTabType != null) {
      suggestTabType = destinationSearchModel.suggestTabType;
      List<TabInfoTypes> tabItems = suggestTabType.tabInfoTypes;
      _contents.add(_createTabs(suggestTabType.title, tabItems));
    }
    if (destinationSearchModel.suggestHotDistrictType != null) {
      suggestHotDistrictType = destinationSearchModel.suggestHotDistrictType;
      List<HotPoiTypes> hotItems = suggestHotDistrictType.hotPoiTypes;
      _contents.add(_createTabs(suggestHotDistrictType.title, hotItems));
    }
    if (destinationSearchModel.suggestPreferType != null) {
      suggestPreferType = destinationSearchModel.suggestPreferType;
      List<PreferInfoTypes> preItems = suggestPreferType.preferInfoTypes;
      _contents.add(_createTabs(suggestPreferType.title, preItems));
    }
    if (destinationSearchModel.suggestPoiType != null) {
      suggestPoiType = destinationSearchModel.suggestPoiType;
      List<PoiInfoTypes> sugItems = suggestPoiType.poiInfoTypes;
      List<Widget> widgets = _createSugItem(sugItems);
      widgets.forEach((i){
        _contents.add(i);
      });
    }
    if (destinationSearchModel.suggestRecommendType != null) {
      suggestRecommendType = destinationSearchModel.suggestRecommendType;
      List<HotPoiTypes> poiItems = suggestRecommendType.hotPoiTypes;
      _contents.add(_createTabs(suggestRecommendType.title, poiItems, poi:'poi'));
    }
    return _contents;
  }

  _onTextChange(String text) {
    keyword = text;
    if (text.length == 0) {
      setState(() {
        destinationSearchModel = null;
        items.clear();
      });
      return;
    }
    String url = widget.searchUrl + text;
    DestinationSearchDao.fetch(url, text).then((DestinationSearchModel model) {
      if (model.keyword == keyword) {
        setState(() {
          destinationSearchModel = model;
        });
        items = _createContent();
        print(model.toJson());
      }
    }).catchError((e) {
      print(e);
    });
  }

  _title(String name) {
    if (name == null) {
      return null;
    }
    List<TextSpan> spans = [];
    spans.addAll(_keywordTextSpans(name, destinationSearchModel.keyword));
    return RichText(text: TextSpan(children: spans));
  }

  _subTitle(SearchItem item) {
    return RichText(
      text: TextSpan(children: <TextSpan>[
        TextSpan(
          text: item.price ?? '',
          style: TextStyle(fontSize: 16, color: Colors.orange),
        ),
        TextSpan(
          text: ' ' + (item.star ?? ''),
          style: TextStyle(fontSize: 12, color: Colors.grey),
        )
      ]),
    );
  }

  _keywordTextSpans(String word, String keyword) {
    List<TextSpan> spans = [];
    if (word == null || word.length == 0) return spans;
    String wordL = word.toLowerCase(), keywordL = keyword.toLowerCase();
    List<String> arr = wordL.split(keywordL);
    TextStyle normalStyle =
        TextStyle(fontFamily: 'PingFang', color: Colors.black87);
    TextStyle keywordStyle =
        TextStyle(fontFamily: 'PingFang', color: Color(0xff0086f6));
    int preIndex = 0;
    for (int i = 0; i < arr.length; i++) {
      if (i != 0) {
        preIndex = wordL.indexOf(keywordL, preIndex);
        spans.add(TextSpan(
            text: word.substring(preIndex, preIndex + keyword.length),
            style: keywordStyle));
      }
      String val = arr[i];
      if (val != null && val.length > 0) {
        spans.add(TextSpan(text: val, style: normalStyle));
      }
    }
    return spans;
  }

  _isSubTitle(SearchItem item) {
    return item.price != null
        ? Container(
            width: 300,
            margin: EdgeInsets.only(top: 5),
            child: _subTitle(item),
          )
        : Container();
  }

  List<Widget> _tabItem(List<dynamic> tabItems) {
    String sName = '';
    String url = '';
    String filter = '';
    return tabItems.map((tabItem){
      if(tabItem is TabInfoTypes) sName = tabItem.tabName;
      if(tabItem is HotPoiTypes) sName = tabItem.searchName;
      if(tabItem is PreferInfoTypes) sName = tabItem.name;
      Widget titleW = Text(sName,overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontSize: 13),textAlign: TextAlign.center,);
      return GestureDetector(
        onTap: () {
          if(tabItem is TabInfoTypes){
            if(tabItem.type == 'ProductPattern') url = 'https://m.ctrip.com/webapp/vacations/tour/list?filter=n${tabItem.tabId}&kwd=${keyword}&kwdfrom=assword&salecity=2&scity=2&searchtype=all&tab=126';
            if(tabItem.tabId == '131072') url = 'https://m.ctrip.com/webapp/dingzhi/index?startDistrictId=2&startName=${tabItem.tabName}&destLandingPoid=&destLandingName=${tabItem.tabName}&productOrigin=13&from=https%3A%2F%2Fm.ctrip.com%2Fwebapp%2Fvacations%2Ftour%2Fdestination%3Ffrompage%3Dlist%26tab%3D126%26searchtype%3Dall%26initkwd%3D%25E4%25B8%2589%25E4%25BA%259A%26query%3Dkwdfrom%253Dassword%2526salecity%253D2%2526scity%253D2';
            else url = 'https://m.ctrip.com/webapp/vacations/tour/list?kwd=${keyword}&kwdfrom=assword&salecity=2&scity=2&searchtype=all&tab=${tabItem.tabId}';
          }
          if(tabItem is HotPoiTypes) {
            url = 'https://m.ctrip.com/webapp/vacations/tour/list?kwd=${tabItem.searchName}&kwdfrom=assword&poid=${tabItem.poid}&salecity=2&scity=2&searchtype=all&tab=126';
          }
          if(tabItem is PreferInfoTypes){
            if (tabItem.name == '5日') filter = 'u5';
            if (tabItem.name == '5钻') filter = 'g5';
            url = 'https://m.ctrip.com/webapp/vacations/tour/list?filter=${filter!=''?filter:tabItem.id}&kwd=${keyword}&kwdfrom=assword&poid=61&poitype=D&salecity=2&scity=2&searchtype=all&tab=126';
          }
          _jumpToSearch(url);
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(0, 0, 6, 8),
          padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
          width: 0.3*MediaQuery.of(context).size.width - 12,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xfff7f7f7),
            borderRadius: BorderRadius.circular(6),
          ),
          child: tabItem is PreferInfoTypes ? Column(
            children: <Widget>[
              titleW,
              Text(tabItem.preferName,overflow: TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontSize: 12,fontFamily: ''),textAlign: TextAlign.center,)
            ],
          )
          : titleW,
        ),
      );
    }).toList();
  }

  Widget _createTabs(String title, List<dynamic> tabList, {String poi = ''}) {
    String icon = 'images/lvxiang.png';
    if(tabList is List<TabInfoTypes>) icon = 'images/lvxiang.png';
    if(tabList is List<HotPoiTypes>) icon = 'images/lvpai_issue_position.png';
    if(poi == 'poi') icon = 'images/lvpai_search_list.png';
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 0.3, color: Colors.grey))),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(12),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: Image(
                    height: 16,
                    width: 16,
                    image: AssetImage(icon),
                  ),
                ),
                _title(title),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Wrap(
              children: _tabItem(tabList),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createPoiInfo(String searchName,int poid, String upperName, String dataType) {
    String icon = 'images/lvpai_search_list.png';
    if(dataType == 'D') icon = 'images/lvpai_issue_position.png';
    if(dataType == '') icon = 'images/lvpai_search_list.png';
    if(dataType == 'SS') icon = 'images/lvpai_issue_sight.png';
    return GestureDetector(
      onTap: () {
        _jumpToSearch('https://m.ctrip.com/webapp/vacations/tour/list?kwd=${searchName}&kwdfrom=assword&poid=${poid.toString()}&poitype=D&salecity=2&scity=2&searchtype=all&tab=126');
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            border:
            Border(bottom: BorderSide(width: 0.3, color: Colors.grey))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 8),
              child: Image(
                height: 16,
                width: 16,
                image: AssetImage(icon),
              ),
            ),
            Expanded(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    _title(searchName),
                    Padding(
                      padding: EdgeInsets.only(right: 6),
                    ),
                    Text(
                      upperName,
                      style: TextStyle(
                        color: Color(0xff999999),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _createSugItem(List<PoiInfoTypes> sugItems) {
   return sugItems.map((sugItem){
      return _createPoiInfo(sugItem.searchName, sugItem.poid, sugItem?.upperName ?? '', sugItem?.dataType ?? '');
    }).toList();
  }

  void _jumpToSearch(String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebView(
          url: url,
          hideAppBar: true,
        ),
      ),
    );
  }
}
