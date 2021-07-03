import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SwipeUpdate extends StatefulWidget {
  final Function()? onSwipeLeft;
  final Function()? onSwipeRight;
  final Function()? onSwipeUp;
  final Function()? onSwipeDown;
  final Widget child;

  final Function()? onFlickLeft;
  final Function()? onFlickRight;
  final Function()? onFlickUp;
  final Function()? onFlickDown;


  SwipeUpdate({
    Key? key,
    required this.child,
    this.onSwipeDown,
    this.onSwipeLeft,
    this.onSwipeRight,
    this.onSwipeUp,

    this.onFlickDown,
    this.onFlickLeft,
    this.onFlickRight,
    this.onFlickUp,x

  }) : super(key: key);

  @override
  _SwipeUpdateState createState() => _SwipeUpdateState();
}

class _SwipeUpdateState extends State<SwipeUpdate> {
  late Offset _horizontalOffset;
  late Offset _verticalOffset;

  late bool _isSwipeLeft;
  late bool _isSwipeRight;
  late bool _isSwipeUp;
  late bool _isSwipeDown;

  @override
  void initState() {
    super.initState();
    //初期の値を（０、０）にする。
    _horizontalOffset = Offset(0, 0);
    _isSwipeDown = _isSwipeUp = _isSwipeRight = _isSwipeLeft = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.child,
      onHorizontalDragStart: (details) {_horizontalOffset = details.localPosition;},
      onHorizontalDragUpdate: (details) {
        if (_horizontalOffset.dx > details.localPosition.dx) {
          //TODO 左
          _isSwipeLeft = true;
          _isSwipeRight = false;
          widget.onSwipeLeft!();
        } else {
          //TODO 右
          _isSwipeRight = true;
          _isSwipeLeft = false;
          widget.onSwipeRight!();
        }

      },
      onHorizontalDragEnd: (details) {
        if (_isSwipeLeft) {
          widget.onFlickLeft!();
        } else if (_isSwipeRight) {
          widget.onFlickRight!();
        }
      },





      onVerticalDragStart: (details) {_verticalOffset = details.localPosition;},
      onVerticalDragUpdate: (details) {
        if (_verticalOffset.dy > details.localPosition.dy) {
          _isSwipeUp = true;
          _isSwipeDown = false;
          widget.onSwipeUp!();
        } else {
          _isSwipeDown = true;
          _isSwipeUp = false;
          widget.onSwipeDown!();
        }
      },

      onVerticalDragEnd: (details) {
        if (_isSwipeUp) {
          widget.onFlickUp!();
        } else if (_isSwipeDown) {
          widget.onFlickDown!();
        }
      },
    );
  }
}