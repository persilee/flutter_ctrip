import 'package:flutter/material.dart';
import 'package:flutter_ctrip/dao/destination_dao.dart';
import 'package:flutter_ctrip/model/destination_model.dart';
import 'package:flutter_ctrip/pages/destination_search_page.dart';
import 'package:flutter_ctrip/pages/speak_page.dart';
import 'package:flutter_ctrip/plugin/vertical_tab_view.dart';
import 'package:flutter_ctrip/util/navigator_util.dart';
import 'package:flutter_ctrip/widget/scalable_box.dart';
import 'package:flutter_ctrip/widget/search_bar.dart';
import 'package:flutter_ctrip/widget/loading_container.dart';
import 'package:flutter_ctrip/widget/webview.dart';

const DEFAULT_TEXT = '目的地 | 主题 | 关键字';

class DestinationPage extends StatefulWidget {
  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> with AutomaticKeepAliveClientMixin {
  DestinationModel destinationModel;
  List<NavigationPopList> navigationList;
  List<Tab> tabs = [];
  List<Widget> tabPages = [];
  bool _isLoading = true;
  bool _isMore = true;
  int pageIndex,buttonIndex;

  @override
  Widget build(BuildContext context) {
    if (tabs.length > 0 && tabPages.length > 0) {
      setState(() {
        _isLoading = false;
      });
    }
    if(Theme.of(context).platform == TargetPlatform.iOS){

    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoadingContainer(
        isLoading: _isLoading,
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: Theme.of(context).platform == TargetPlatform.iOS?92:86),
              child: VerticalTabView(
                tabsWidth: 88,
                tabsElevation: 0,
                indicatorWidth: 0,
                selectedTabBackgroundColor: Colors.white,
                backgroundColor: Colors.white,
                tabTextStyle: TextStyle(
                  height: 60,
                  color: Color(0xff333333),
                ),
                tabs: tabs,
                contents: tabPages,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8, 6, 6, 10),
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
                  defaultText: DEFAULT_TEXT,
                  speakClick: _jumpToSpeak,
                  rightButtonClick: _jumpToService,
                  rightIcon: true,
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
        List<Row> visibleRows = [];
        List<Widget> unVisibleSpans = [];
        List<Row> unVisibleRows = [];
        for (var k = 0;
            k < navigationList[i].destAreaList[j].child.length;
            k++) {
          String imgName = navigationList[i].destAreaList[j].child[k].text;
          String tagName = navigationList[i].destAreaList[j].child[k].tagList.length > 0 ?
          navigationList[i].destAreaList[j].child[k].tagList[0].tagName : '';
          String spanText = navigationList[i].destAreaList[j].child[k].text;
          int tagListL = navigationList[i].destAreaList[j].child[k].tagList.length;
          String picUrl = navigationList[i].destAreaList[j].child[k].picUrl;
          String kwd = navigationList[i].destAreaList[j].child[k].kwd;
          int id = navigationList[i].destAreaList[j].child[k].id;
          ///图片
          if (picUrl != '' && picUrl != null) {
            imageItems.add(
              createImage(picUrl,tagListL,tagName,imgName,kwd,id),
            );
          } else {
            ///标签
            //当标签数量小于9个时，放到可以显示的容器
            if (k < 9) {
              visibleSpans.add(
                createSpan(spanText, tagListL, tagName, kwd, id),
              );
            } else if (k >= 9) {
              unVisibleSpans.add(
                createSpan(spanText, tagListL, tagName, kwd, id),
              );
            }
          }
        }
        if (visibleSpans.length >= 9) {
          visibleRows.add(Row(
            children: visibleSpans.sublist(0,3),
          ));
          visibleRows.add(Row(
            children: visibleSpans.sublist(3,6),
          ));
          visibleRows.add(Row(
            children: visibleSpans.sublist(6,9),
          ));
        }else if(visibleSpans.length > 0 && visibleSpans.length < 9){
          if(visibleSpans.length % 3 ==1){
            visibleSpans.add(Expanded(child: Container()));
            visibleSpans.add(Expanded(child: Container()));
          }else if(visibleSpans.length % 3 ==2){
            visibleSpans.add(Expanded(child: Container()));
          }
          int vStart = 0;
          for (var k = 0; k < visibleSpans.length; k++) {
            if((k+1) % 3 == 0 && k != 0){
              visibleRows.add(Row(
                children: visibleSpans.sublist(vStart,(k+1)),
              ));
              vStart = k + 1;
            }
          }
        }
        int unStart = 0;
        if (unVisibleSpans.length >= 9) {
          if(unVisibleSpans.length % 3 == 1){
            unVisibleSpans.add(Expanded(child: Container()));
            unVisibleSpans.add(Expanded(child: Container()));
          }else if(unVisibleSpans.length % 3 == 2){
            unVisibleSpans.add(Expanded(child: Container()));
          }
          for (var k = 0; k < unVisibleSpans.length; k++) {
            if((k+1) % 3 == 0 && k != 0){
              unVisibleRows.add(Row(
                children: unVisibleSpans.sublist(unStart,(k+1)),
              ));
              unStart = k + 1;
            }
          }
        }
        // 处理数据 每3条数据放到一个row容器
        List<Widget> rowList = [];
        if(imageItems.length % 3 ==1) {
          imageItems.add(Expanded(child: Container()));
          imageItems.add(Expanded(child: Container()));
        }else if(imageItems.length % 3 ==2){
          imageItems.add(Expanded(child: Container()));
        }
        int start = 0;
        for (var k = 0; k < imageItems.length; k++) {
          if((k+1) % 3 == 0 && k != 0){
            rowList.add(Row(
              children: imageItems.sublist(start,(k+1)),
            ),);
            start = k + 1;
          }else if(imageItems.length - start < 3){
            rowList.add(Row(
              children: imageItems.sublist(start),
            ),);
            break;
          }
        }
        tabPage.add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rowList,
          ),
        );
        if(visibleRows.length>0){
          tabPage.add(
            ScalableBox(visibleRows,unVisibleRows),
          );
        }
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
  }

  void _jumpToSearch() {
    NavigatorUtil.push(
      context,
      DestinationSearchPage(
        hint: DEFAULT_TEXT,
        hideLeft: false,
      ),
    );
  }

  void _jumpToSpeak() {
    NavigatorUtil.push(context, SpeakPage(pageType: 'destination',));
  }

  void _jumpToService() {
    NavigatorUtil.push(context, WebView(
      url: 'https://m.ctrip.com/webapp/servicechatv2/?bizType=1105&channel=VAC&orderInfo=&isPreSale=1&pageCode=220008&thirdPartytoken=F2BCB02915C58496DD7DEA00278B68AF&sceneCode=0&isFreeLogin=',
      hideAppBar: false,
      title: '客服',
    ));
  }

  void _loadData() {
    DestinationDao.fetch().then((DestinationModel model) {
      setState(() {
        destinationModel = model;
        navigationList = destinationModel.navigationPopList;
      });
      _createTab();
      _createTabPage(context);
    }).catchError((e) => print(e));
  }

  void _buttonMore(int i, int j) {
    pageIndex = i;
    buttonIndex = j;
    _isMore = !_isMore;
  }

  Widget createSpan (String text, int tagListL, String tagText, String kwd, int id) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          _openWebView(kwd,id);
        },
        child: Stack(
          children: <Widget>[
            Container(
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
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff333333)
                        .withAlpha(220),
                    fontSize: 13),
              ),
            ),
            tagListL>0?Positioned(
              top: -8,
              right: 4,
              child: Container(
                padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                height: 18,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffff7600),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6),
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(6),
                  ),
                ),
                child: Text(tagText,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Colors.white,fontSize: 12,),),
              ),
            ):Container(),
          ],
          overflow: Overflow.visible,
        ),
      ),
    );
  }

  Widget createImage (String picUrl, int tagListL, String tagName, String imgName, String kwd, int id) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          _openWebView(kwd,id);
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
          child: Column(
            children: <Widget>[
              PhysicalModel(
                borderRadius: BorderRadius.circular(6),
                clipBehavior: Clip.antiAlias,
                color: Colors.transparent,
                elevation: 5,
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Image.network(
                        picUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    tagListL>0?Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                        height: 18,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xffff7600),
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(8))
                        ),
                        child: Text(tagName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(color: Colors.white,fontSize: 12,),),
                      ),
                    ):Container(),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                child: Text(
                  imgName,
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
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void _openWebView(String kwd, int id) {
    NavigatorUtil.push(context, WebView(
      url: 'https://m.ctrip.com/webapp/vacations/tour/list?identifier=choice&kwd=${kwd}&poid=${id.toString()}&poitype=D&salecity=2&scity=2&searchtype=all&tab=126',
      hideAppBar: true,
    ));
  }
}
