import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => AnotherPage())));

    var assetsImage = new AssetImage(
        'assets/images/test.png'); //<- Creates an object that fetches an image.
    var image = new Image(
      image: assetsImage,
      height: deviceSize.height * 0.6,
      width: deviceSize.width * 0.8,
    ); //<- Creates a widget that displays an image.

    return Material(
      type: MaterialType.transparency,
      child: new Container(
        height: deviceSize.height,
        width: deviceSize.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                stops: [
              0.4,
              0.6,
              0.9
            ],
                colors: [
              Color.fromRGBO(111, 198, 25, 1),
              Color.fromRGBO(159, 235, 83, 1),
              Color.fromRGBO(132, 214, 50, 1),
              
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[image],
        ),
      ),
    );
  }
}

// place: "/anotherPage"
class AnotherPage extends StatefulWidget {
  AnotherPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnotherPageState createState() => new _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    var decoratedBox = new DecoratedBox(
        decoration: new BoxDecoration(
      image: new DecorationImage(
        fit: BoxFit.fitWidth,
        image: new AssetImage('assets/images/test.png'),
      ),
      shape: BoxShape.circle,
    ));

    // hero center
    var hero = new Hero(
      tag: 'hero-tag',
      child: decoratedBox,
    );

    return Material(
      type: MaterialType.transparency,
      child: new Container(
        color: Colors.white,
        height: deviceSize.height,
        width: deviceSize.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width * 0.4,
                child: hero,
              ),
            ]),
      ),
    );
  }
}
