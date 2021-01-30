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
  double _value = 0.0;
  void onChange(double value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Name Here"),
      ),
      body: Container(
        padding: new EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              new Slider(value: _value, onChanged: onChange),
              new Container(
                padding: EdgeInsets.all(32.0),
                child: new LinearProgressIndicator(
                  value: _value,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              new Container(
                padding: EdgeInsets.all(32.0),
                child: new CircularProgressIndicator(
                  value: _value,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
