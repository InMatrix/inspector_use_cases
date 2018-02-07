// This use case is based on this Stack Overflow question:
// https://stackoverflow.com/questions/45932105/flutter-align-widget-rect-does-not-detect-the-ontap-gesture
// Question: Flutter Align widget rect does not detect the onTap gesture?
// Source of the problem: the default value of GestureDetector.behavior is not
// known to the user.

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Container(
        height: 48.0,
        child: new Row(
          children: <Widget>[
            new GestureDetector(
//              The line below fixes the problem:
//              behavior: HitTestBehavior.opaque,
              onTap: cancelTurn,
              child: new Align(child: new Icon(Icons.cancel), widthFactor: 1.5),
            ),
            new Expanded(child: new Container()),
            new GestureDetector(
              onTap: confirmTurn,
              child: new Align(child: new Icon(Icons.check), widthFactor: 1.5),
            ),
          ],
        ),
      )
    );
  }

  void cancelTurn() {
    print("Cancel!");
  }

  void confirmTurn() {
    print("Confirm!");
  }
}
