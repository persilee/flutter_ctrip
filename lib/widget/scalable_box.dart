import 'package:flutter/material.dart';

class ScalableBox extends StatefulWidget {
  @override
  _ScalableBoxState createState() => _ScalableBoxState();
}

class _ScalableBoxState extends State<ScalableBox> {
  bool _isMore = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
