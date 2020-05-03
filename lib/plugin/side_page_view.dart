import 'package:flutter/material.dart';

/// A scrollable list that works page by page with a custom title and controls.
///
/// Internally, [SidePageView] wraps a [PageView] and places a title bar with
/// optional control buttons above it. The API mimics to the one of [PageView],
/// hence you can also consult the documentation of [PageView] for some of the
/// members. Similar to [PageView] you can use a [PageController] to control
/// which page is visible in the view.
class SidePageView extends StatefulWidget {
  /// Takes two [List]'s and constructs the title and the body from them.
  ///
  /// The lists are both directly wrapped in [IndexedWidgetBuilder]. Since every
  /// Widget in the list must be explicitly created, consider using this
  /// constructor only for small lists. [titleChildren] and [children] do not
  /// need to have the same number of elements, but consequently the title and
  /// the body will not be synchronised after enough page flips.
  SidePageView({
    Key key,
    this.reverse = false,
    this.pageSnapping = true,
    this.fadeEffect = true,
    this.controlButtons = true,
    PageController controller,
    this.physics,
    this.onPageChanged,
    List<Widget> titleChildren = const [],
    List<Widget> children = const [],
  }) : controller = controller ?? PageController(),
        titleBuilder =
        ((BuildContext context, int index) => titleChildren[index % titleChildren.length]),
        bodyBuilder =
        ((BuildContext context, int index) => children[index % titleChildren.length]);

  /// Takes two [IndexedWidgetBuilder]'s and constructs the title and the body from them.
  ///
  /// Creates a semi-infinitely scrollable [PageView], where the title is build from
  /// [titleBuilder] and the body from [bodyBuilder]. Contrary to [PageView.builder],
  /// there is no [itemCount] option, in order to make the [SidePageView] finite sized.
  SidePageView.builder({
    Key key,
    this.reverse = false,
    this.pageSnapping = true,
    this.fadeEffect = true,
    this.controlButtons = true,
    PageController controller,
    this.physics,
    this.onPageChanged,
    @required this.titleBuilder,
    @required this.bodyBuilder
  }) : controller = controller ?? PageController();

  /// The axis along which the page view scrolls.
  ///
  /// Defaults to [Axis.horizontal].
  final bool reverse;

  /// Whether to snap to page after scrolling.
  ///
  /// Defaults to true
  final bool pageSnapping;

  /// Make the title fade in and out
  ///
  /// Defaults to true
  final bool fadeEffect;

  /// Option to add control buttons to the title.
  ///
  /// These buttons will be displayed as [chevron_left] and [chevron_right] and
  /// change the body and title by an entire page. Defaults to true
  final bool controlButtons;

  /// Controls the scrolling behaviour of the title and the body
  final PageController controller;

  /// Scroll physics for the body
  ///
  /// If non given the body uses the default value for [PageView].
  final ScrollPhysics physics;

  /// Called after the [PageView] reports a change of pages.
  final ValueChanged<int> onPageChanged;

  /// Builder objects for the title
  ///
  /// The [SidePageView] constructor builds this by going repeatedly through the
  /// titleChildren list. Explicitly:
  /// ```
  /// (int index) => titleChildren[index % titleChildren.length])
  /// ```
  /// The [titleBuilder] can be set
  /// directly by the [SidePageView.builder] constructor.
  final IndexedWidgetBuilder titleBuilder;

  /// Builder objects for the title
  ///
  /// The [SidePageView] constructor builds this by going repeatedly through the
  /// children list. Explicitly:
  /// ```
  /// (int index) => titleChildren[index % titleChildren.length])
  /// ```
  /// The [titleBuilder] can be set directly by the [SidePageView.builder] constructor.
  final IndexedWidgetBuilder bodyBuilder;

  @override
  State<StatefulWidget> createState() => _SidePageViewState(initialPage: controller.initialPage);
}

class _SidePageViewState extends State<SidePageView> {
  _SidePageViewState({int initialPage}) :
        _titleController = PageController(initialPage: initialPage),
        _oldPage = initialPage;

  final PageController _titleController;
  int _oldPage;

  double _controllerAnimationValue = 0.0;


  @override void initState() {
    super.initState();
    widget.controller.addListener(() {

      setState(() {
        if( (_oldPage - widget.controller.page).abs() >= 0.5) _oldPage = widget.controller.page.round();

        _controllerAnimationValue = (widget.controller.page - _oldPage).abs();

        _titleController.jumpTo(0.5*widget.controller.offset);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          _controlBar(),
          Expanded(
            child: PageView.builder(
              reverse: widget.reverse,
              pageSnapping: widget.pageSnapping,
              physics: widget.physics,
              onPageChanged: widget.onPageChanged,
              controller: widget.controller,
              itemBuilder: widget.bodyBuilder,
            ),
          )
        ],
      ),
    );
  }

  Widget _controlBar() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      height: 25,
      alignment: Alignment(0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          widget.controlButtons ? IconButton(
              padding: EdgeInsets.all(0.0),
              icon: Icon(Icons.chevron_left, size: 25.0,),
              onPressed: () {
                widget.controller.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease
                );
              }
          ) : Container(),
          _title(),
          widget.controlButtons ? IconButton(
              padding: EdgeInsets.all(0.0),
              icon: Icon(Icons.chevron_right,size: 25.0,),
              onPressed: () {
                print('-----------------' + widget.controller.page.toString());
                widget.controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease
                );
              }
          ) : Container(),
        ],
      ),
    );
  }

  Widget _title() {
    print(MediaQuery.of(context).size.width*0.5);
    return Container(
      width: 0.5*MediaQuery.of(context).size.width,
      height: double.infinity,
      child: PageView.builder(
          reverse: widget.reverse,
          pageSnapping: false,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: _titleController,
          itemBuilder: (BuildContext context, int index) {
            return Align(
              child: widget.fadeEffect ?
              Opacity(
                opacity: (1.0 - 2*_controllerAnimationValue).clamp(0.25,1.0),
                child: widget.titleBuilder(context, index),
              ) :
              widget.titleBuilder(context, index),
            );
          }
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _titleController.dispose();
  }
}