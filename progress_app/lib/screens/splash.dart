import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class StartScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return new PageView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[ Container(
            color: Colors.yellow,
            width: deviceSize.width * 0.5,
            height: deviceSize.height * 0.5,
          ),]
        ),
        Container(
          color: Colors.cyan,
        ),
        Container(
          color: Colors.deepPurple,
        ),
      ],
    );
  }
}
