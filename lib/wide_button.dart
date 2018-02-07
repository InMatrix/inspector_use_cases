// Inspired by https://gist.githubusercontent.com/mit-mit/653b3253fba71d151c86c579b9e3519a/raw/2f848c7282d26bf66475306b2c54f19dcbb7d96b/main.dart
// From the render Tree, the user can see widthFactor == 'expand' https://screenshot.googleplex.com/whv3os25KOe
// But how can they find the right property value for this?

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final padding = 8.0;
    final _title = new TextEditingController();
    final _email = new TextEditingController();
    final _description = new TextEditingController();

    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('repro'),
        ),
        body: new Padding(
          padding: new EdgeInsets.all(padding),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                child: new ListView(
                  children: <Widget>[
                    new BorderTextField(
                      controller: _title,
                      hintText: 'Title',
                    ),
                    new SizedBox(height: padding),
                    new BorderTextField(
                      controller: _email,
                      hintText: 'Email address',
                    ),
                    new SizedBox(height: padding),
                    new BorderTextField(
                      controller: _description,
                      hintText: 'Description',
                      maxLines: 10,
                    ),
                  ],
                ),
              ),
              new SizedBox(height: padding),
              new BorderButton(
                label: 'Submit issue',
                minWidth: 200.0,
              ),
              new SizedBox(height: padding),
            ],
          ),
        ),
      ),
    );
  }
}

class BorderTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int maxLines;

  BorderTextField({
    @required this.hintText,
    @required this.controller,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return new DecoratedBox(
      decoration: new BoxDecoration(
        border: new Border.all(
          width: 2.0,
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: new Padding(
        padding: new EdgeInsets.all(8.0),
        child: new TextField(
          controller: controller,
          decoration: new InputDecoration.collapsed(
            hintText: hintText,
          ),
          maxLines: maxLines,
        ),
      ),
    );
  }
}

class BorderButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double minWidth;
  final double minHeight;

  BorderButton({
    this.label,
    this.onTap,
    this.minWidth = 8.0,
    this.minHeight = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    Widget buttonContents = new Text(label);

// Issue: Uncommenting the next three lines makes the button surprisingly wide.
    buttonContents = new Center(
//      widthFactor: 1.0,
      child: buttonContents,
    );

    return new DecoratedBox(
      decoration: new BoxDecoration(
        border: new Border.all(
          width: 2.0,
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: new InkWell(
        child: new Padding(
          padding: new EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8.0,
          ),
          child: buttonContents,
        ),
        onTap: onTap,
      ),
    );
  }
}
