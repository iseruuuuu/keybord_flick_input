import 'dart:math';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

import 'button.dart';




class CalMyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalcApp7(),
    );
  }
}

class CalcApp7 extends StatefulWidget {
  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp7> {

  double fontSize = 20;
  int onTap = 1;
  bool isNumber = false;

  //計算履歴のすべて　＝＞          途中式　＝ 答え
  List<String> listItem = [];

  //計算履歴　＝＞              途中式 　  sqrt 3
  List<String> listItem2 = [];

  //() をつけた計算履歴         （途中式）  (sqrt 3)
  List<String> listItem3 = [];

  List<String> listItem4 = []; // 途中式  √3

  List<String> listItem5 = []; // (途中式) (√３)


  //表示用 =>                  _historyの中身　（表示のため）
  List<String> cal2 = [];

  //計算                       _historyの中身　（計算のため）
  List<String> cal = [];

  //途中式を記載するためのString
  String _expression = '';

  String _expression2 = '';

  //計算をする際にListからStringに変換するためのString
  String _exp = '';

  String _expp = '';

  //途中式 ＝ 計算結果のためのString
  String _exp2 = '';

  String _exp3 = '';


  @override
  void initState() {
    super.initState();
  }

  void numClick(String text) {
    print(text);
    setState(() {
      if (text == "√") {
        //表示用 =>                  _historyの中身　（表示のため）
        cal2.add('√');
        //計算                       _historyの中身　（計算のため）
        cal.add('sqrt');
        _expression = cal.join('');
        _expression2 = cal2.join('');
      } else {
        //表示用 =>                  _historyの中身　（表示のため）
        cal2.add(text);
        //計算                       _historyの中身　（計算のため）
        cal.add(text);
        _expression = cal.join('');
        _expression2 = cal2.join('');
      }
    });
  }

  void substitution(String text) {
    setState(() {
      //TODO 代入した際に、計算（裏）と計算(表)の２つそれぞれ代入しなければならない。
      //  print('計算裏' + text);
      cal.add(text);
      _expression = cal.join('');
    });
  }

  void substitution2(String text) {
    //TODO 計算（表）
    setState(() {
      // print('計算表' + text);
      cal2.add(text);
      _expression2 = cal2.join('');
    });
  }


  void delete() {
    setState(() {
      //配列ができた。。。
      cal.removeAt(cal.length - 1);
      cal2.removeAt(cal2.length - 1);
      // print(cal);
      // print(cal2);
      _expression = cal.join('');
      _expression2 = cal2.join('');
    });
  }

  void allClear(String text) {
    setState(() {
      cal.clear();
      cal2.clear();
      _expression = cal2.join('');
      _expression2 = cal.join('');
      listItem.clear();
      listItem2.clear();
      listItem3.clear();
      listItem4.clear();
      listItem5.clear();
    });
  }

  void clear(String text) {
    setState(() {
      cal.clear();
      cal2.clear();
      _expression = cal2.join('');
      _expression2 = cal.join('');
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    setState(() {
      //TODO 計算の配列をString型に直す。
      _exp = cal.join('');

      _expp = cal2.join('');
      //print(_expp);
      // print(_exp); // 9*9
      _exp2 = _expp; // 9*9の途中式専用

      // TODO ①(途中式)  ② 途中式  ③計算結果
      // ①
      listItem3.add('(' + _exp + ')');
      // print(listItem3);//[(99*9)]
      listItem5.add('(' + _expp + ')');
      // print(listItem5);
      // ②
      listItem2.add(_exp);

      listItem4.add(_expp);
      // print(listItem2);//[99*9]
      //   print(listItem4);
      // ③
      _exp = exp.evaluate(EvaluationType.REAL, cm).toString();
      //　途中式　＝　結果

      //_exp2　を見かけの計算にする。
      _exp3 = _exp2 + ' = ' + _exp;
      //  print(_exp3);//

      listItem.add(_exp3);
      //print(listItem);// 9/9=1.0
      _expression = '';
      //_expression2 = '';
      _expression2 = _exp;
      _exp = '';
      _expp = '';
      _exp2 = '';
      _exp3 = '';
      cal.clear();
      cal2.clear();
    });
  }

  void blank(String text) {

  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double width = MediaQuery.of(context).size.width * 0.18;

    bool checkUp = false;
    bool checkDown = false;
    bool checkRight = false;
    bool checkLeft = false;

    bool changeUp = false;
    bool changeDown = false;
    bool changeRight = false;
    bool changeLeft = false;

    String label = '未記入';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xDD000000),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.black,
          ),
        ),
        body: Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                NumberButton(
                  text: '9',
                  callback: numClick,
                  callback2: () {
                    numClick('+');
                  },
                  onUp: () {
                    numClick('*');
                  },
                  onRight: () {
                    numClick('+');
                  },
                  onLeft: () {
                    numClick('-');
                  },
                  onDown: () {
                    numClick('/');
                  },

                  onDown2: () {},
                  onRight2: () {},
                  onLeft2: () {},
                  onUp2: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void action() {
    Navigator.pop(context);
  }
}

