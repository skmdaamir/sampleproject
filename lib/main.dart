import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static Duration duration = new Duration(milliseconds: 100);
  Timer timer;
  double _value = 0.0;
  bool _active = true;

  @override
  void initState() {
    timer = new Timer.periodic(duration, _timeout);
  }

  void _timeout(Timer timer) {
    if (!_active) return;
    setState(() {
      _value = _value + 0.01;
      if (_value == 1.0) _active = false;
    });
  }

  void _onPressed() {
    setState(() {
      _value = 0.0;
      _active = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text("Name Here"),
        ),
        body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: [
                new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new LinearProgressIndicator(
                    value: _value,
                    backgroundColor: Colors.white,
                  ),
                ),
                new RaisedButton(
                  onPressed: _onPressed,
                  child: new Text('Start'),
                )
              ],
            ),
          ),
        ));
  }
}
