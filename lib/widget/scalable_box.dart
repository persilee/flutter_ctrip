import 'package:flutter/material.dart';

class ScalableBox extends StatefulWidget {
  final List<Row> visibleSpans;
  final List<Row> unVisibleSpans;

  ScalableBox(this.visibleSpans, this.unVisibleSpans);

  @override
  _ScalableBoxState createState() => _ScalableBoxState();
}

class _ScalableBoxState extends State<ScalableBox> {
  bool _isMore = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget.visibleSpans.length>=1?widget.visibleSpans[0]:Container(),
          widget.visibleSpans.length>=2?widget.visibleSpans[1]:Container(),
          widget.visibleSpans.length>=3?widget.visibleSpans[2]:Container(),
          Offstage(
            offstage: _isMore,
            child: Column(
              children: widget.unVisibleSpans,
            ),
          ),
          widget.unVisibleSpans.length>0?Container(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isMore = !_isMore;
                });
              },
              child: _isMore
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '展开',
                          style: TextStyle(color: Colors.blue, fontFamily: ''),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.blue,
                          size: 16,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '收起',
                          style: TextStyle(color: Colors.blue, fontFamily: ''),
                        ),
                        Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.blue,
                          size: 16,
                        ),
                      ],
                    ),
            ),
          ):Container(),
        ],
      ),
    );
  }
}
