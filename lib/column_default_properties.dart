// This use case is based on this Stack Overflow question:
// https://stackoverflow.com/questions/41845693/how-can-i-tightly-wrap-a-column-of-widgets-inside-a-card
// Question: how can I tightly wrap a column of a widgets inside a card?
// Source of the problem: the default property values of the Column widget are
// invisible in the code.


import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Stretched Column',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Stretched Column'),
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
        title: new Text(widget.title),
      ),
      body: new Card(
        child: new Column(
          // To solve the problem, add the following line:
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text(
              'Heading',
            ),
            new ListView(
              shrinkWrap: true,
              children: <Widget>[
                new Text('Item 1'),
                new Text('Item 2'),
                new Text('Item 3'),
                new Text('Item 4'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
