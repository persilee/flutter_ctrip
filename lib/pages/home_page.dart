import 'package:flutter/material.dart';
import 'package:flutter_ctrip/dao/home_dao.dart';
import 'package:flutter_ctrip/model/common_model.dart';
import 'package:flutter_ctrip/model/grid_nav_model.dart';
import 'package:flutter_ctrip/model/home_model.dart';
import 'package:flutter_ctrip/model/sales_box_model.dart';
import 'package:flutter_ctrip/plugin/square_swiper_pagination.dart';
import 'package:flutter_ctrip/widget/grid_nav.dart';
import 'package:flutter_ctrip/widget/local_nav.dart';
import 'package:flutter_ctrip/widget/sales_box.dart';
import 'package:flutter_ctrip/widget/sub_nav.dart';
import 'package:flutter_ctrip/widget/webview.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_ctrip/widget/loading_container.dart';
import 'dart:convert';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    'https://dimg04.c-ctrip.com/images/zg0m1e000001ft33l2B3A.jpg',
    'https://dimg04.c-ctrip.com/images/zg0r1f000001g93pa8043.jpg',
    'https://dimg04.c-ctrip.com/images/zg0n1e000001fh5i4F9D7.jpg',
    'https://dimg04.c-ctrip.com/images/zg0p1e000001f50p101A5.jpg',
    'https://dimg04.c-ctrip.com/images/zg0m1e000001ft33l2B3A.jpg',
    'https://dimg04.c-ctrip.com/images/zg0r1f000001g93pa8043.jpg'
  ];

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
                        height: 230,
                        child: Stack(
//                    overflow: Overflow.visible,
                          children: <Widget>[
                            Container(
                              height: 182,
                              child: Swiper(
                                itemCount: bannerList.length,
                                autoplay: true,
                                pagination: SwiperPagination(
                                    builder: SquareSwiperPagination(
                                      size: 7,
                                      activeSize: 7,
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
                              top: 158,
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
                            GridNav(
                              gridNavModel: gridNavModel,
                            ),
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
            Opacity(
              opacity: appBarAlpha,
              child: Container(
                height: 80,
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text('首页'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
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
}
