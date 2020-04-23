import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
 Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset('images/second.png'),
      ),
    );
  }
}
