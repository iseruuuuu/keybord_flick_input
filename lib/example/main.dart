import 'package:flutter/material.dart';
import 'package:tapontap_app/example/swipe_gesture.dart';

import 'package:tapontap_app/widget/swipe_update.dart';



//TODO フリックした時の三角形を作りたい。
//TODO 長押しからのフリック

class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
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
                        onSwipeUp: () {setState(() {checkUp = true;checkDown = false;checkLeft = false;checkRight = false;});},
                        onSwipeLeft: () {setState(() {checkUp = false;checkDown = false;checkLeft = true;checkRight = false;});},
                        onSwipeDown: () {setState(() {checkUp = false;checkDown = true;checkLeft = false;checkRight = false;});},
                        onSwipeRight: () {setState(() {checkUp = false;checkDown = false;checkLeft = false;checkRight = true; });},

                        onFlickUp: () {setState(() {
                          label = '*';/*TODO 上*/
                          changeLeft = false; changeDown = false; changeUp = false; changeRight = false; checkUp = false;});},
                        onFlickLeft: () {setState(() {
                          label = '-';/*TODO 左*/
                          print('左'); changeLeft = true; changeDown = false; changeUp = false; changeRight = false; checkLeft = false;});},
                        onFlickRight: () {setState(() {
                          label = '+';/*TODO 右*/
                          print('右'); changeLeft = false; changeDown = false; changeUp = false; changeRight = true; checkRight = false;});},
                        onFlickDown: () {setState(() {
                          label = '/';/*TODO 下*/
                          print('下'); changeLeft = false; changeDown = true; changeUp = false; changeRight = false; checkDown = false;});},
                        child: GestureDetector(
                            onTap: () {setState(() {
                              label = '5';
                              checkUp = false;checkDown = false;checkLeft = false;checkRight = false;changeUp = false;changeDown = false;changeLeft = false;changeRight = false;});},
                            onLongPress: () {setState(() {checkUp = true;checkDown = true;checkLeft = true; checkRight = true;});},
                            onLongPressEnd: (details) {setState(() {checkUp = false;checkDown = false;checkLeft = false; checkRight = false;});},
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


          SizedBox(height: 40),
          Text(label,style: TextStyle(fontSize: 40),),


          /* //TODO 割といい感じの案
          Visibility(visible: checkUp, child: Container(width: 100, height: 100, color: Colors.grey, child: const Center(child: Text('*')),)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Visibility(visible: checkLeft, child: Container(width: 100, height: 100, color: Colors.grey, child: const Center(child: Text('-')),)),
              Center(child: SwipeUpdate(
                onSwipeUp: () {setState(() {checkUp = true;checkDown = false;checkLeft = false;checkRight = false;});},
                onSwipeDown: () {setState(() {checkUp = false;checkDown = true;checkLeft = false;checkRight = false;});},
                onSwipeRight: () {setState(() {checkUp = false;checkDown = false;checkLeft = false;checkRight = true; });},
                onSwipeLeft: () {setState(() {checkUp = false;checkDown = false;checkLeft = true;checkRight = false;});},
                child: GestureDetector(
                  onTap: () {setState(() {checkUp = false;checkDown = false;checkLeft = false; checkRight = false;});},
                    child: Container(width: 100, height: 100, color: Colors.yellow, child: const Center(child: Text('5')),)),),),
              Visibility(visible: checkRight, child: Container(width: 100, height: 100, color: Colors.grey, child: const Center(child: Text('+')),)),],),
          Visibility(visible: checkDown, child: Container(width: 100, height: 100, color: Colors.grey, child: const Center(child: Text('/')),)),
           */





        ],
      ),
    );
  }

  Widget s () {
    return Column(
      children: [
        ue(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hidari(),
            blank(),
            migi(),
          ],
        ),
        sita(),
      ],
    );
  }

  Widget ue() {
    return Container(
      width: 100,
      height: 100,
      //color: Colors.black26,
      color: checkUp ? Colors.white : Colors.black26,
      child: const Center(child: Text('*',style: TextStyle(fontSize: 130),)),
    );
  }


  Widget sita() {
    return Container(
      width: 100,
      height: 100,
      color: checkDown ? Colors.white : Colors.black26,
      child: const Center(child: Text('/',style: TextStyle(fontSize: 70),)),
    );
  }

  Widget migi() {
    return Container(
      width: 100,
      height: 100,
      color: checkRight ? Colors.white : Colors.black26,
      child: const Center(child: Text('+',style: TextStyle(fontSize: 70),)),
    );
  }

  Widget hidari() {
    return Container(
      width: 100,
      height: 100,
      color: checkLeft ? Colors.white : Colors.black26,
      child: const Center(child: Text('ー',style: TextStyle(fontSize: 70),)),
    );
  }

  Widget blank() {
    return SwipeGesture(
      onSwipeUp: () {
        print('1');
        //上のボタンを色を変化させる
        setState(() {
          checkUp = true;
        });
      },
      onSwipeDown: () {
        print('2');
        //上のボタンを色を変化させる
      },
      onSwipeRight: () {
        print('3');
        //上のボタンを色を変化させる
      },
      onSwipeLeft: () {
        print('4');
        //上のボタンを色を変化させる
      },
      child: Container(
        width: 100,
        height: 100,
        color: Colors.black,
        child: const Center(child: Text('7',style: TextStyle(fontSize: 130),)),
      ),
    );
  }



}


/*
  /*
                        BoxDecoration(
                          border: Border(
                            left: BorderSide(

                             */
 */

/*
 /*
                        decoration: BeveledRectangleBorder(
                          side: BorderSide(),
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
                             */

 */