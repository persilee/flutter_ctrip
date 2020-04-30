import 'package:flutter/material.dart';
import 'package:flutter_ctrip/dao/trave_search_dao.dart';
import 'package:flutter_ctrip/dao/trave_search_hot_dao.dart';
import 'package:flutter_ctrip/model/seach_model.dart';
import 'package:flutter_ctrip/model/travel_search_hot_model.dart';
import 'package:flutter_ctrip/model/travel_search_model.dart';
import 'package:flutter_ctrip/pages/speak_page.dart';
import 'package:flutter_ctrip/util/navigator_util.dart';
import 'package:flutter_ctrip/widget/search_bar.dart';
import 'package:flutter_ctrip/widget/webview.dart';

const TYPES = [
  'topic',
  'place',
  'user',
  'hotword',
  'district'
];
const URL =
    'https://m.ctrip.com/restapi/soa2/16189/json/appSuggest?_fxpcqlniredt=09031043410934928682&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650016495&__gw_platform=H5';

class TravelSearchPage extends StatefulWidget {
  final bool hideLeft;
  final String searchUrl;
  final String keyword;
  final String hint;

  TravelSearchPage(
      {this.hideLeft = true,
      this.searchUrl = URL,
      this.keyword,
      this.hint = "目的地 | 酒店 | 景点 | 航班号"});

  @override
  _TravelSearchPageState createState() => _TravelSearchPageState();
}

class _TravelSearchPageState extends State<TravelSearchPage> {
  TravelSearchModel travelSearchModel;
  String keyword;
  TravelSearchHotModel travelSearchHotModel;
  List<ResourceItems> resourceItems;
  String hotTitle = '';
  int listNum;
  List<Items> items = [];
  bool _isHidden = false;

  @override
  void initState() {
    if (widget.keyword != null) {
      _onTextChange(widget.keyword);
    }
    _loadSearchHotData();
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
              child: ListView.builder(
                  itemCount: items?.length ?? 0,
                  itemBuilder: (BuildContext context, int position) {
                    return _item(position);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  _item(int position) {
    print(items.length);
    if (items == null) return null;
    if (items[position].resourceType == 'topic') {
      print('topic');
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/lvpai_search_tag.png',
                  width: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6),
                ),
                Text(
                  '#',
                  style: TextStyle(fontSize: 16),
                ),
                _title(items[position].name),
              ],
            ),
            Text(
              items[position].articleCount.toString() + '篇旅拍',
              style: TextStyle(
                fontFamily: '',
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    } else if (items[position].resourceType == 'sight') {
      print('sight');
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/lvpai_issue_sight.png',
                  width: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6),
                ),
                _title(items[position].name),
              ],
            ),
            Text(
              items[position].articleCount.toString() + '篇旅拍',
              style: TextStyle(
                fontFamily: '',
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    } else if (items[position].resourceType == 'user') {
      print('user');
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(items[position].imageUrl),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(items[position].title),
                Row(
                  children: <Widget>[
                    Text(
                      items[position].articleCount.toString() + '篇旅拍',
                      style: TextStyle(
                          fontFamily: '',
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      items[position].followCount.toString() + '粉丝',
                      style: TextStyle(
                          fontFamily: '',
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    } else if (items[position].resourceType == 'hotword') {
      print('hotword');
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/lvpai_search_list.png',
                  width: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6),
                ),
                Text(
                  items[position].title,
                ),
              ],
            ),
          ],
        ),
      );
    }else if (items[position].resourceType == 'district') {
      print('district');
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/lvpai_issue_position.png',
                  width: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6),
                ),
                Text(
                  items[position].title,
                ),
              ],
            ),
          ],
        ),
      );
    }
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
        ),
        Offstage(
          offstage: _isHidden,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Text(
                  hotTitle,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 6, 0),
                child: Wrap(
                  spacing: 6,
                  runSpacing: 0,
                  children: _hotChip(context),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _hotChip(BuildContext context) {
    if (resourceItems == null) return [];
    List<Widget> _chip = [];
    resourceItems.forEach((resourceItem) {
      _chip.add(_hotItem(context, resourceItem));
    });
    return _chip;
  }

  Widget _hotItem(BuildContext context, ResourceItems resourceItem) {
    if (resourceItem.iconUrl != '') {
      return GestureDetector(
        onTap: () {
          NavigatorUtil.push(
              context,
              WebView(
                url: resourceItem.h5Url,
                title: '携程旅拍',
              ));
        },
        child: Chip(
          backgroundColor: Color(0xffF4F4F4),
          avatar: Image.network(
            resourceItem?.iconUrl,
            height: 18,
            width: 18,
          ),
          label: Text(
            resourceItem?.title,
            style: TextStyle(fontFamily: '', fontWeight: FontWeight.w400),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          NavigatorUtil.push(
              context,
              WebView(
                url: resourceItem.h5Url,
                title: '携程旅拍',
              ));
        },
        child: Chip(
          backgroundColor: Color(0xffF4F4F4),
          label: Text(
            resourceItem?.title,
            style: TextStyle(fontFamily: '', fontWeight: FontWeight.w400),
          ),
        ),
      );
    }
  }

  _jumpToSpeak() {
    NavigatorUtil.push(context, SpeakPage());
  }

  _onTextChange(String text) {
    keyword = text;
    if (text.length == 0) {
      setState(() {
        travelSearchModel = null;
        _isHidden = false;
        items.clear();
      });
      return;
    }
    TravelSearchDao.fetch(widget.searchUrl, text)
        .then((TravelSearchModel model) {
      print(model.toJson());
      setState(() {
        travelSearchModel = model;
      });
      _creatItems();
    }).catchError((e) {
      print(e);
    });
    _isHidden = true;
  }

  _creatItems() {
    if (items.length > 0) items.clear();
    if (travelSearchModel == null || travelSearchModel.result == null)
      return null;
    travelSearchModel.result.forEach((result) {
      result.items.forEach((item) {
        items.add(item);
      });
    });
    return items;
  }

  _loadSearchHotData() {
    TravelSearchHotDao.fetch().then((TravelSearchHotModel model) {
      setState(() {
        travelSearchHotModel = model;
        hotTitle = travelSearchHotModel.hotResult[0].title;
        resourceItems = travelSearchHotModel.hotResult[0].resourceItems;
      });
    }).catchError((e) {
      print(e);
    });
  }

  _title(String name) {
    if (name == null) {
      return null;
    }
    List<TextSpan> spans = [];
    spans.addAll(_keywordTextSpans(name, travelSearchModel.keyword));
    return RichText(text: TextSpan(children: spans));
  }

  _keywordTextSpans(String word, String keyword) {
    List<TextSpan> spans = [];
    if (word == null || word.length == 0) return spans;
    String wordL = word.toLowerCase(), keywordL = keyword.toLowerCase();
    List<String> arr = wordL.split(keywordL);
    TextStyle normalStyle = TextStyle(fontSize: 16, color: Colors.black);
    TextStyle keywordStyle =
        TextStyle(fontSize: 16, color: Colors.lightBlueAccent);
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
}
