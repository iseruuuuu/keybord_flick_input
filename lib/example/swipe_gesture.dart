import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SwipeGesture extends StatefulWidget {
  final Function() onSwipeLeft;
  final Function() onSwipeRight;
  final Function() onSwipeUp;
  final Function() onSwipeDown;
  final Widget child;
  SwipeGesture({
    Key? key,
    required this.child,
    required this.onSwipeDown,
    required this.onSwipeLeft,
    required this.onSwipeRight,
    required this.onSwipeUp,
  }) : super(key: key);

  @override
  _SwipeGestureState createState() => _SwipeGestureState();
}

class _SwipeGestureState extends State<SwipeGesture> {
  late Offset _horizontalOffset;
  late Offset _verticalOffset;

  //方向の判定を決める
  late bool _isSwipeLeft;
  late bool _isSwipeRight;
  late bool _isSwipeUp;
  late bool _isSwipeDown;

  @override
  void initState() {
    super.initState();
    //初期の値を（０、０）にする。
    _horizontalOffset = Offset(0, 0);
    //全ての方向をfalseにする。
    _isSwipeDown = _isSwipeUp = _isSwipeRight = _isSwipeLeft = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.child,
      onHorizontalDragStart: (details) {
        _horizontalOffset = details.localPosition;
      },
      onHorizontalDragUpdate: (details) {
        if (_horizontalOffset.dx > details.localPosition.dx) {
          _isSwipeLeft = true;
          _isSwipeRight = false;
        } else {
          _isSwipeRight = false;
          _isSwipeLeft = true;
        }
      },
      onHorizontalDragEnd: (details) {
        if (_isSwipeLeft) {
          widget.onSwipeLeft();
        } else if (_isSwipeRight) {
          widget.onSwipeRight();
          print(_horizontalOffset.dx);
        }
      },
      onVerticalDragStart: (details) {
        _verticalOffset = details.localPosition;
      },
      onVerticalDragUpdate: (details) {
        if (_verticalOffset.dy > details.localPosition.dy) {
          _isSwipeUp = true;
          _isSwipeDown = false;
        } else {
          _isSwipeDown = true;
          _isSwipeUp = false;
        }
      },
      onVerticalDragEnd: (details) {
        if (_isSwipeUp) {
          widget.onSwipeUp();
        } else if (_isSwipeDown) {
          widget.onSwipeDown();
        }
      },
    );
  }

  Widget block({required Offset postion}) {
    return Transform.translate(
      offset: postion,
      //位置（座標)は変更可能にしたい
      child: Container(
        //TODO widthは一定
        width: 50,
        //TODO hightは一定
        height: 50,
        //TODO 色は一定
        color: Colors.black,
      ),
    );
  }
}