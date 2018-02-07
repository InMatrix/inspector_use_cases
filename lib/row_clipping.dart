// This use case is based on this Stack Overflow question:
// https://stackoverflow.com/questions/41727553/how-can-i-prevent-a-multi-line-text-widget-from-getting-clipped-when-placed-with/41728135#41728135
// Question: How can I prevent a multi-line Text widget from getting clipped when placed within a Row?


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
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Container(
          child: new Row(
            children: [
              new Icon(Icons.navigate_before),
              // Wrap the Text inside an expanded will fix the problem
              new Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
              new Icon(Icons.navigate_next),
            ],
          ),
          decoration: new BoxDecoration(
            color: Colors.grey[300],
          ),
          width: 400.0,
        ),
      ),
    );
  }
}
