import 'package:flutter/material.dart';
import 'package:flutter_ctrip/model/travel_hot_keyword_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

enum SearchBarType { home, normal, homeLight }

class SearchBar extends StatefulWidget {
  final bool enabled;
  final bool hideLeft;
  final bool isUserIcon;
  final SearchBarType searchBarType;
  final String hint;
  final String defaultText;
  final void Function() leftButtonClick;
  final void Function() rightButtonClick;
  final void Function() speakClick;
  final void Function() inputBoxClick;
  final ValueChanged<String> onChanged;
  final List<HotKeyword> hintList;

  const SearchBar(
      {Key key,
      this.enabled = true,
      this.isUserIcon: false,
      this.hideLeft,
      this.searchBarType = SearchBarType.normal,
      this.hint,
      this.defaultText,
      this.leftButtonClick,
      this.rightButtonClick,
      this.speakClick,
      this.inputBoxClick,
      this.onChanged,
      this.hintList})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool showClear = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.defaultText != null) {
      setState(() {
        _controller.text = widget.defaultText;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBarType.normal
        ? _genNormalSearch()
        : _genHomeSearch();
  }

  _genNormalSearch() {
    return Container(
      child: Row(children: <Widget>[
        _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(6, 5, 10, 5),
              child: widget?.hideLeft ?? false
                  ? null
                  : Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 24,
                    ),
            ),
            widget.leftButtonClick),
        Expanded(
          flex: 1,
          child: _inputBox(),
        ),
        _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text(
                '搜索',
                style: TextStyle(color: Colors.blue, fontSize: 17),
              ),
            ),
            widget.rightButtonClick)
      ]),
    );
  }

  _genHomeSearch() {
    String sMessage;
    if (widget.searchBarType == SearchBarType.home) {
      sMessage = 'images/xiaoxi_white.png';
    } else {
      sMessage = 'images/xiaoxi_grey.png';
    }
    return Container(
      child: Row(children: <Widget>[
        Expanded(
          flex: 1,
          child: _inputBox(),
        ),
        _wrapTap(
            widget.isUserIcon
                ? Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Image.asset(
                      'images/user1.png',
                      height: 24,
                      width: 24,
                    ),
                  )
                : Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Image.asset(
                      sMessage,
                      height: 24,
                      width: 24,
                    ),
                  ),
            widget.rightButtonClick)
      ]),
    );
  }

  _inputBox() {
    Color inputBoxColor;
    if (widget.searchBarType == SearchBarType.home) {
      inputBoxColor = Colors.white;
    } else {
      inputBoxColor = Color(int.parse('0xffEDEDED'));
    }
    return Container(
      height: 34,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: inputBoxColor, borderRadius: BorderRadius.circular(17)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('images/sousuo.png',width: 17,),
          Expanded(
              flex: 1,
              child: widget.searchBarType == SearchBarType.normal
                  ? TextField(
                      controller: _controller,
                      onChanged: _onChanged,
                      autofocus: true,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                      //输入文本的样式
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: Theme.of(context).platform == TargetPlatform.iOS ? EdgeInsets.fromLTRB(4, 0, 4, 15): EdgeInsets.fromLTRB(4, 0, 4, 13),
                        hintText: widget.hint ?? '',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ))
                  : _wrapTap(
                      widget.hintList != null
                          ? Swiper(
                              scrollDirection: Axis.vertical,
                              itemCount: widget.hintList?.length,
                              autoplay: true,
                              physics: NeverScrollableScrollPhysics(),
                              autoplayDelay: 3000,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: EdgeInsets.fromLTRB(4, 7, 0, 0),
                                  child: Text(
                                    widget.hintList[index].prefix +
                                        "\“" +
                                        widget.hintList[index].content +
                                        "\”",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                );
                              },
                            )
                          : Container(
                              padding: EdgeInsets.only(left: 4),
                              child: Text(
                                widget.defaultText,
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ),
                      widget.inputBoxClick)),
          !showClear
              ? _wrapTap(
                  Image.asset('images/yuyin.png',width: 17,),
                  widget.speakClick)
              : _wrapTap(
                  Icon(
                    Icons.clear,
                    size: 22,
                    color: Colors.grey,
                  ), () {
                  setState(() {
                    _controller.clear();
                  });
                  _onChanged('');
                })
        ],
      ),
    );
  }

  _wrapTap(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) callback();
      },
      child: child,
    );
  }

  _onChanged(String text) {
    if (text.length > 0) {
      setState(() {
        showClear = true;
      });
    } else {
      setState(() {
        showClear = false;
      });
    }
    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
  }

  _homeFontColor() {
    return widget.searchBarType == SearchBarType.homeLight
        ? Colors.black54
        : Colors.white;
  }
}
