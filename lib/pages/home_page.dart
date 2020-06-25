import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ctrip/dao/home_dao.dart';
import 'package:flutter_ctrip/model/common_model.dart';
import 'package:flutter_ctrip/model/grid_nav_model.dart';
import 'package:flutter_ctrip/model/home_model.dart';
import 'package:flutter_ctrip/model/sales_box_model.dart';
import 'package:flutter_ctrip/pages/search_page.dart';
import 'package:flutter_ctrip/pages/speak_page.dart';
import 'package:flutter_ctrip/plugin/square_swiper_pagination.dart';
import 'package:flutter_ctrip/util/navigator_util.dart';
import 'package:flutter_ctrip/widget/grid_nav.dart';
import 'package:flutter_ctrip/widget/grid_nav_new.dart';
import 'package:flutter_ctrip/widget/local_nav.dart';
import 'package:flutter_ctrip/widget/sales_box.dart';
import 'package:flutter_ctrip/widget/search_bar.dart';
import 'package:flutter_ctrip/widget/sub_nav.dart';
import 'package:flutter_ctrip/widget/webview.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_ctrip/widget/loading_container.dart';

const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = '目的地 | 酒店 | 景点 | 航班号';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double appBarAlpha = 0;
  List<CommonModel> localNavList = [];
  GridNavModel gridNavModel;
  List<CommonModel> subNavList = [];
  SalesBoxModel salesBoxModel;
  bool _isLoading = true;
  List<CommonModel> bannerList = [];

  @override
  void initState() {
    super.initState();
    _handleRefresh();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafc),
      body: LoadingContainer(
        isLoading: _isLoading,
        child: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: NotificationListener(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification &&
                      scrollNotification.depth == 0) {
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                  return true;
                },
                child: RefreshIndicator(
                  onRefresh: _handleRefresh,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: 262,
                        child: Stack(
//                    overflow: Overflow.visible,
                          children: <Widget>[
                            Container(
                              height: 210,
                              child: Swiper(
                                itemCount: bannerList.length,
                                autoplay: true,
                                pagination: SwiperPagination(
                                  builder: SquareSwiperPagination(
                                    size: 6,
                                    activeSize: 6,
                                    color: Colors.white.withAlpha(80),
                                    activeColor: Colors.white,
                                  ),
                                  alignment: Alignment.bottomRight,
                                  margin: EdgeInsets.fromLTRB(0, 0, 14, 28),
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      CommonModel model = bannerList[index];
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => WebView(
                                            url: model.url,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Image.network(
                                      bannerList[index].icon,
                                      fit: BoxFit.fill,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              top: 188,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                child: LocalNav(
                                  localNavList: localNavList,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          children: <Widget>[
//                            GridNav(
//                              gridNavModel: gridNavModel,
//                            ),
                            GridNavNew(),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                            ),
                            SubNav(
                              subNavList: subNavList,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                            ),
                            SalesBox(
                              salesBoxModel: salesBoxModel,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _appBar,
          ],
        ),
      ),
    );
  }

  Widget get _appBar {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              //AppBar渐变遮罩背景
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(14, 20, 0, 0),
            height: 86.0,
            decoration: BoxDecoration(
                color:
                    Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: appBarAlpha == 1.0
                        ? Colors.black12
                        : Colors.transparent,
                    offset: Offset(2, 3),
                    blurRadius: 6,
                    spreadRadius: 0.6,
                  ),
                ]),
            child: SearchBar(
              searchBarType: appBarAlpha > 0.2
                  ? SearchBarType.homeLight
                  : SearchBarType.home,
              inputBoxClick: _jumpToSearch,
              defaultText: SEARCH_BAR_DEFAULT_TEXT,
              leftButtonClick: () {},
              speakClick: _jumpToSpeak,
              rightButtonClick: _jumpToUser,
            ),
          ),
        ),
        Container(
            height: appBarAlpha > 0.2 ? 0.5 : 0,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)]))
      ],
    );
  }

  _jumpToSpeak() {
    NavigatorUtil.push(context, SpeakPage());
  }

  void _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(alpha);
  }

  Future<Null> _handleRefresh() async {
    try {
      HomeModel homeModel = await HomeDao.fetch();
      setState(() {
        localNavList = homeModel.localNavList;
        gridNavModel = homeModel.gridNav;
        subNavList = homeModel.subNavList;
        salesBoxModel = homeModel.salesBox;
        bannerList = homeModel.bannerList;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        print(e);
        setState(() {
          _isLoading = false;
        });
      });
    }
    return null;
  }

  void _jumpToSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPage(
          hint: SEARCH_BAR_DEFAULT_TEXT,
          hideLeft: false,
        ),
      ),
    );
  }

  void _jumpToUser() {
    NavigatorUtil.push(
      context,
      WebView(
        url:
            'https://m.ctrip.com/webapp/servicechatv2/messagelist/?from=%2Fwebapp%2Fmyctrip%2Findex',
        hideHead: false,
        hideAppBar: false,
        title: '我的消息',
      ),
      callBack: () {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
      }
    );
  }
}
