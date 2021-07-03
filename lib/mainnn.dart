import 'package:flutter/material.dart';
import 'package:tapontap_app/swipe_update.dart';

//TODO フリックした時の三角形を作りたい。
//TODO 長押しからのフリック

class MyApp221 extends StatelessWidget {
  const MyApp221({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool checkUp = false;
  bool checkDown = false;
  bool checkRight = false;
  bool checkLeft = false;

  bool changeUp = false;
  bool changeDown = false;
  bool changeRight = false;
  bool changeLeft = false;
  String label = '未記入';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(visible: checkUp, maintainSize: true, maintainAnimation: true, maintainState: true, child: Container(width: 73, height: 73, color: changeUp ? Colors.grey : Colors.orange, child: const Center(child: Text('*', style: TextStyle(color: Colors.white, fontSize: 60),)))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: checkLeft,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Container(
                      width: 73,
                      height: 73,
                      color: changeLeft ? Colors.grey : Colors.orange,
                      child: const Center(
                        child: Text('-',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 60
                          ),
                        ),
                      ),
                    ),
                  ),

                  Center(child: SwipeUpdate(
                    onSwipeUp: () {
                      setState(() {
                        checkUp = true;
                        checkDown = false;
                        checkLeft = false;
                        checkRight = false;
                      });},
                    onSwipeLeft: () {
                      setState(() {
                        checkUp = false;
                        checkDown = false;
                        checkLeft = true;
                        checkRight = false
                        ;});},
                    onSwipeDown: () {setState(() {
                      checkUp = false;
                      checkDown = true;
                      checkLeft = false;
                      checkRight = false;
                    });},
                    onSwipeRight: () {
                      setState(() {
                        checkUp = false;
                        checkDown = false;
                        checkLeft = false;
                        checkRight = true;
                      });},


                    onFlickUp: () {
                      setState(() {
                        label = '*';
                        /*TODO 上*/
                        changeLeft = false;
                        changeDown = false;
                        changeUp = false;
                        changeRight = false;
                        checkUp = false;
                      });},
                    onFlickLeft: () {
                      setState(() {
                        label = '-';
                        /*TODO 左*/
                        changeLeft = true;
                        changeDown = false;
                        changeUp = false;
                        changeRight = false;
                        checkLeft = false;
                      });},
                    onFlickRight: () {
                      setState(() {
                        label = '+';
                        /*TODO 右*/
                        changeLeft = false;
                        changeDown = false;
                        changeUp = false;
                        changeRight = true;
                        checkRight = false;
                      });},
                    onFlickDown: () {
                      setState(() {
                        label = '/';
                        /*TODO 下*/
                        changeLeft = false;
                        changeDown = true;
                        changeUp = false;
                        changeRight = false;
                        checkDown = false;
                      });},
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          label = '5';
                          checkUp = false;
                          checkDown = false;
                          checkLeft = false;
                          checkRight = false;
                          changeUp = false;
                          changeDown = false;
                          changeLeft = false;
                          changeRight = false;
                        });},
                      onLongPress: () {
                        setState(() {
                          checkUp = true;
                          checkDown = true;
                          checkLeft = true;
                          checkRight = true
                          ;});},
                      onLongPressEnd: (details) {
                        setState(() {
                          checkUp = false;
                          checkDown = false;
                          checkLeft = false;
                          checkRight = false
                          ;});},
                      child: Container(
                        width: 73,
                        height: 73,
                        color: Color(0xff424242),
                        child: const Center(
                          child: Text('5',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 60
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ),
                  Visibility(
                    visible: checkRight,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState
                        : true,
                    child: Container(
                      width: 73,
                      height: 73,
                      color: changeRight ? Color(0xff424242) : Colors.orange,
                      child: const Center(child: Text(
                        '+',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 60
                        ),
                      )),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: checkDown,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  width: 73,
                  height: 73,
                  color: changeDown ? Colors.grey : Colors.orange,
                  child: const Center(
                    child: Text(
                      '/',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 60
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}