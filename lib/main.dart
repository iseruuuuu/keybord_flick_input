import 'package:flutter/material.dart';
import 'package:tapontap_app/touch_lock.dart';
import 'widget/mainnn.dart';


void main() {
  //runApp(CalMyApp());
  runApp(MyApp221());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TouchLock(
        backButton: TextButton(onPressed: null, child: Text('Click Me')) ,
        unlockButton: TextButton(onPressed: null, child: Text('Click Me')) ,
        lockButton: TextButton(onPressed: null, child: Text('Click Me')) ,
        right: 20 , //Padding
        top: 20 , //Padding
        numbers: ['One','Two','Three','Four','Five','Six','Seven','Eight','Nine'] ,
        text: 'Choose' ,
        buttonSize: 40 ,
        child: const Text(''),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
