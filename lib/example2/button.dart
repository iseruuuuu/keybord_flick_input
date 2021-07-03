import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tapontap_app/example2/swipe_update.dart';



class NumberButton extends StatelessWidget {
  final String text;
  final String? text2;
  final int? fillColor;
  final int? textColor;
  final double? textSize;
  final Function? callback;
  final Function? callback2;

  final Function()? onLeft;
  final Function()? onRight;
  final Function()? onUp;
  final Function()? onDown;

  final Function()? onLeft2;
  final Function()? onRight2;
  final Function()? onUp2;
  final Function()? onDown2;



  final String? upText;
  final String? downText;
  final String? rightText;
  final String? leftText;

  const NumberButton({
    Key? key,
    required this.text,
    this.text2,
    this.fillColor,
    this.textColor = 0xFFFFFFFF,
    this.textSize = 28,
    this.callback,
    this.callback2,
    this.onLeft,
    this.onRight,
    this.onUp,
    this.onDown,

    this.onLeft2,
    this.onDown2,
    this.onRight2,
    this.onUp2,

    this.upText,
    this.downText,
    this.rightText,
    this.leftText,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    bool checkUp = false;
    bool checkDown = false;
    bool checkRight = false;
    bool checkLeft = false;

    bool changeUp = false;
    bool changeDown = false;
    bool changeRight = false;
    bool changeLeft = false;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
            visible: checkUp,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Container(
                width: 100,
                height: 100,
                color: changeUp ? Colors.grey : Colors.orange,
                child: const Center(child: Text('*',style: TextStyle(color: Colors.white,fontSize: 60),)))),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: checkLeft,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Container(
                      width: 100,
                      height: 100,
                      color: changeLeft ? Colors.grey : Colors.orange,
                      child: const Center(child: Text('-',style: TextStyle(color: Colors.white,fontSize: 60),)))),
              Center(
                  child: SwipeUpdate(
                      onSwipeUp: () {
                        checkUp = true;
                        checkDown = false;
                        checkLeft = false;
                        checkRight = false;

                        onUp2!();
                      },
                      onSwipeLeft: () {
                        checkUp = false;
                        checkDown = false;
                        checkLeft = true;
                        checkRight = false;

                        onLeft2!();
                      },
                      onSwipeDown: () {
                        checkUp = false;
                        checkDown = true;
                        checkLeft = false;
                        checkRight = false;

                        onDown2!();
                      },
                      onSwipeRight: () {
                        checkUp = false;
                        checkDown = false;
                        checkLeft = false;
                        checkRight = true;

                        onRight2!();
                      },

                      onFlickUp: () {
                        /*TODO 上*/
                        changeLeft = false;
                        changeDown = false;
                        changeUp = false;
                        changeRight = false;
                        checkUp = false;

                        onUp!();
                      },
                      onFlickLeft: () {
                        /*TODO 左*/
                        changeLeft = true;
                        changeDown = false;
                        changeUp = false;
                        changeRight = false;
                        checkLeft = false;

                        onLeft!();
                      },
                      onFlickRight: () {
                        /*TODO 右*/
                        changeLeft = false;
                        changeDown = false;
                        changeUp = false;
                        changeRight = true;
                        checkRight = false;

                        onRight!();
                      },
                      onFlickDown: () {
                        /*TODO 下*/
                        changeLeft = false;
                        changeDown = true;
                        changeUp = false;
                        changeRight = false;
                        checkDown = false;

                        onDown!();
                      },

                      child: GestureDetector(
                          onTap: () {
                            checkUp = false;
                            checkDown = false;
                            checkLeft = false;
                            checkRight = false;

                            changeUp = false;
                            changeDown = false;
                            changeLeft = false;
                            changeRight = false;

                            callback!(text);
                          },
                          onLongPress: () {
                            checkUp = true;
                            checkDown = true;
                            checkLeft = true;
                            checkRight = true;

                            callback2!();
                          },
                          onLongPressEnd: (details) {
                            checkUp = false;
                          checkDown = false;
                          checkLeft = false;
                          checkRight = false;
                          },
                          child: Container(
                              width: 100,
                              height: 100,
                              color: Color(0xff424242),
                              child: Center(
                                  child: Text(
                                    text,
                                    style: TextStyle(color: Colors.white,fontSize: 60),)))))),
              Visibility(
                  visible: checkRight,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Container(
                      width: 100,
                      height: 100,
                      color: changeRight ? Color(0xff424242) : Colors.orange,
                      child: const Center(child: Text('+',style: TextStyle(color: Colors.white,fontSize: 60),))))]),
        Visibility(
          visible: checkDown,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Container(
              width: 100,
              height: 100,
              color: changeDown ? Colors.grey : Colors.orange,
              child: const Center(child: Text('/',style: TextStyle(color: Colors.white,fontSize: 60),))),
        ),
      ],
    );
  }
}




//TODO もしかしたらある＞？？？

/*



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tapontap_app/button_method/swipe_update.dart';


class NumberButton extends StatelessWidget {
  final String? text;
  final String? text2;
  final int? fillColor;
  final int? textColor;
  final double? textSize;
  final Function? callback;
  final Function? callback2;

  final Function()? onLeft;
  final Function()? onRight;
  final Function()? onUp;
  final Function()? onDown;

  const NumberButton({
    Key? key,
    this.text,
    this.text2,
    this.fillColor,
    this.textColor = 0xFFFFFFFF,
    this.textSize = 28,
    this.callback,
    this.callback2,
    this.onLeft,
    this.onRight,
    this.onUp,
    this.onDown,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    bool checkUp = false;
    bool checkDown = false;
    bool checkRight = false;
    bool checkLeft = false;

    bool changeUp = false;
    bool changeDown = false;
    bool changeRight = false;
    bool changeLeft = false;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
            visible: checkUp,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Container(
                width: 100,
                height: 100,
                color: changeUp ? Colors.grey : Colors.orange,
                child: const Center(child: Text('*',style: TextStyle(color: Colors.white,fontSize: 60),)))),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: checkLeft,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Container(
                      width: 100,
                      height: 100,
                      color: changeLeft ? Colors.grey : Colors.orange,
                      child: const Center(child: Text('-',style: TextStyle(color: Colors.white,fontSize: 60),)))),
              Center(
                  child: SwipeUpdate(
                      onSwipeUp: () {
                        checkUp = true;
                        checkDown = false;
                        checkLeft = false;
                        checkRight = false;
                      },
                      onSwipeLeft: () {
                        checkUp = false;
                        checkDown = false;
                        checkLeft = true;
                        checkRight = false;
                      },
                      onSwipeDown: () {
                        checkUp = false;
                        checkDown = true;
                        checkLeft = false;
                        checkRight = false;
                      },
                      onSwipeRight: () {
                        checkUp = false;
                        checkDown = false;
                        checkLeft = false;
                        checkRight = true;
                      },

                      onFlickUp: () {
                        /*TODO 上*/
                        changeLeft = false;
                        changeDown = false;
                        changeUp = false;
                        changeRight = false;
                        checkUp = false;
                      },
                      onFlickLeft: () {
                        /*TODO 左*/
                        print('左');
                        changeLeft = true;
                        changeDown = false;
                        changeUp = false;
                        changeRight = false;
                        checkLeft = false;
                      },
                      onFlickRight: () {
                        /*TODO 右*/
                        print('右');
                        changeLeft = false;
                        changeDown = false;
                        changeUp = false;
                        changeRight = true;
                        checkRight = false;
                      },
                      onFlickDown: () {
                        /*TODO 下*/
                        print('下');
                        changeLeft = false;
                        changeDown = true;
                        changeUp = false;
                        changeRight = false;
                        checkDown = false;
                      },

                      child: GestureDetector(
                          onTap: () {
                            checkUp = false;
                            checkDown = false;
                            checkLeft = false;
                            checkRight = false;

                            changeUp = false;
                            changeDown = false;
                            changeLeft = false;
                            changeRight = false;
                          },
                          onLongPress: () {
                            checkUp = true;
                            checkDown = true;
                            checkLeft = true;
                            checkRight = true;
                          },
                          onLongPressEnd: (details) {checkUp = false;
                          checkDown = false;
                          checkLeft = false;
                          checkRight = false;
                          },
                          child: Container(
                              width: 100,
                              height: 100,
                              color: Color(0xff424242),
                              child: const Center(child: Text('5',style: TextStyle(color: Colors.white,fontSize: 60),)))))),
              Visibility(
                  visible: checkRight,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Container(
                      width: 100,
                      height: 100,
                      color: changeRight ? Color(0xff424242) : Colors.orange,
                      child: const Center(child: Text('+',style: TextStyle(color: Colors.white,fontSize: 60),))))]),
        Visibility(
          visible: checkDown,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Container(
              width: 100,
              height: 100,
              color: changeDown ? Colors.grey : Colors.orange,
              child: const Center(child: Text('/',style: TextStyle(color: Colors.white,fontSize: 60),))),
        ),
      ],
    );
  }
}
/*
    return Container(
      margin: EdgeInsets.only(top: 2,bottom: 2,right: 0,left: 0),
      child: SizedBox(
        width: width,
        height: width,
        child: Theme(
          data: ThemeData(splashColor: Colors.black),
          child: Material(
            elevation: 0,
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: InkWell(
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius .circular(20),
                ),
                onPressed: () {
                  callback!(text);
                },
                onLongPress: () {
                  callback2!(text2);
                  HapticFeedback.heavyImpact();
                },
                child: Text(text!, style: TextStyle(
                      fontSize: textSize,
                  ),
                ),
                color: fillColor != null ? Color(fillColor!) : null,
                textColor: Color(textColor!),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

     */
 */