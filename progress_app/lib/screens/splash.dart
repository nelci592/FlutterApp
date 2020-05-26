import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';
import '../screens/auth/auth_screen.dart';

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
        Duration(milliseconds: 1500),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => AnotherPage())));

    var decoratedBoxLogo = new DecoratedBox(
        decoration: new BoxDecoration(
      image: new DecorationImage(
        fit: BoxFit.fitWidth,
        image: new AssetImage('assets/images/progress.png'),
      ),
      shape: BoxShape.circle,
    ));

    var heroLogo = new Hero(
      tag: 'hero-tag-logo',
      child: decoratedBoxLogo,
    );

    return Material(
      type: MaterialType.transparency,
      child: new Container(
        height: deviceSize.height,
        width: deviceSize.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              height: deviceSize.height * 0.8,
              width: deviceSize.width * 0.9,
              child: heroLogo,
            ),
          ],
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    Timer(
      Duration(seconds: 1),
      () => Navigator.of(context).pushReplacement(PageRouteBuilder(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (_, __, ___) => SecondPage())),
    );

    var decoratedBoxLogo = new DecoratedBox(
        decoration: new BoxDecoration(
      image: new DecorationImage(
        fit: BoxFit.fitWidth,
        image: new AssetImage('assets/images/progress.png'),
      ),
      shape: BoxShape.circle,
    ));

    var heroLogo = new Hero(
      tag: 'hero-tag-logo',
      child: decoratedBoxLogo,
    );

    var decoratedBoxPlanet = new DecoratedBox(
        decoration: new BoxDecoration(
      image: new DecorationImage(
        fit: BoxFit.fitWidth,
        image: new AssetImage('assets/images/011_planet.png'),
      ),
      shape: BoxShape.circle,
    ));

    var heroPlanet = new Hero(
      tag: 'hero-tag-planet',
      child: decoratedBoxPlanet,
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
                height: deviceSize.height * 0.2,
                width: deviceSize.width * 0.6,
                padding: EdgeInsets.only(top: deviceSize.height * 0.05),
                child: heroLogo,
              ),
              Container(
                padding: EdgeInsets.only(top: deviceSize.height * 0.3),
                height: deviceSize.height * 0.01,
                width: deviceSize.width * 0.01,
                child: heroPlanet,
              ),
            ]),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SecondPageState createState() => new _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    Timer(
      Duration(milliseconds: 800),
      () => Navigator.of(context).pushReplacement(PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 800),
          pageBuilder: (_, __, ___) => ThirdPage())),
    );

    var decoratedBoxPlanet = new DecoratedBox(
        decoration: new BoxDecoration(
      image: new DecorationImage(
        fit: BoxFit.fitWidth,
        image: new AssetImage('assets/images/011_planet.png'),
      ),
      shape: BoxShape.circle,
    ));

    var heroPlanet = new Hero(
      tag: 'hero-tag-planet',
      child: decoratedBoxPlanet,
    );

    var decoratedBoxCar = new DecoratedBox(
        decoration: new BoxDecoration(
      image: new DecorationImage(
        fit: BoxFit.fitWidth,
        image: new AssetImage('assets/images/012_car.png'),
      ),
      shape: BoxShape.circle,
    ));

    var heroCar = new Hero(
      tag: 'hero-tag-car',
      child: decoratedBoxCar,
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
              height: deviceSize.height * 0.2,
              width: deviceSize.width * 0.6,
              padding: EdgeInsets.only(top: deviceSize.height * 0.05),
              child: Image.asset('assets/images/progress.png'),
            ),
            Container(
              height: deviceSize.height * 0.75,
              width: deviceSize.width,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: deviceSize.height * 0.7,
                    width: deviceSize.width,
                    padding: EdgeInsets.only(bottom: deviceSize.height * 0.05),
                    child: heroPlanet,
                  ),
                  Positioned(
                    left: deviceSize.width * 0.72,
                    top: deviceSize.height * 0.435,
                    child: Container(
                        height: deviceSize.height * 0.01,
                        width: deviceSize.width * 0.01,
                        child: heroCar),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  ThirdPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ThirdPageState createState() => new _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    Timer(
      Duration(milliseconds: 800),
      () => Navigator.of(context).pushReplacement(PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 800),
          pageBuilder: (_, __, ___) => ForthPage())),
    );

    var decoratedBoxCar = new DecoratedBox(
        decoration: new BoxDecoration(
      image: new DecorationImage(
        fit: BoxFit.fitWidth,
        image: new AssetImage('assets/images/012_car.png'),
      ),
      shape: BoxShape.circle,
    ));

    var heroCar = new Hero(
      tag: 'hero-tag-car',
      child: decoratedBoxCar,
    );

    var decoratedBoxController = new DecoratedBox(
        decoration: new BoxDecoration(
      image: new DecorationImage(
        fit: BoxFit.fitWidth,
        image: new AssetImage('assets/images/013_controller.png'),
      ),
      shape: BoxShape.circle,
    ));

    var heroController = new Hero(
      tag: 'hero-tag-controller',
      child: decoratedBoxController,
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
              height: deviceSize.height * 0.2,
              width: deviceSize.width * 0.6,
              padding: EdgeInsets.only(top: deviceSize.height * 0.05),
              child: Image.asset('assets/images/progress.png'),
            ),
            Container(
              height: deviceSize.height * 0.75,
              width: deviceSize.width,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: deviceSize.height * 0.7,
                    width: deviceSize.width,
                    padding: EdgeInsets.only(bottom: deviceSize.height * 0.05),
                    child: SvgPicture.asset('assets/images/011_planet.svg'),
                  ),
                  Positioned(
                    left: deviceSize.width * 0.22,
                    top: deviceSize.height * 0.23,
                    child: Container(
                        height: deviceSize.height * 0.18,
                        width: deviceSize.width * 0.18,
                        child: heroCar),
                  ),
                  Positioned(
                    left: deviceSize.width * 0.8,
                    top: deviceSize.height * 0.355,
                    child: Container(
                        height: deviceSize.height * 0.01,
                        width: deviceSize.width * 0.01,
                        child: heroController),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForthPage extends StatefulWidget {
  ForthPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ForthPageState createState() => new _ForthPageState();
}

class _ForthPageState extends State<ForthPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    Timer(
      Duration(milliseconds: 800),
      () => Navigator.of(context).pushReplacement(PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 800),
          pageBuilder: (_, __, ___) => AuthScreen())),
    );

    var decoratedBoxController = new DecoratedBox(
        decoration: new BoxDecoration(
      image: new DecorationImage(
        fit: BoxFit.fitWidth,
        image: new AssetImage('assets/images/013_controller.png'),
      ),
      shape: BoxShape.circle,
    ));

    var heroController = new Hero(
      tag: 'hero-tag-controller',
      child: decoratedBoxController,
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
              height: deviceSize.height * 0.2,
              width: deviceSize.width * 0.6,
              padding: EdgeInsets.only(top: deviceSize.height * 0.05),
              child: Image.asset('assets/images/progress.png'),
            ),
            Container(
              height: deviceSize.height * 0.75,
              width: deviceSize.width,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: deviceSize.height * 0.7,
                    width: deviceSize.width,
                    padding: EdgeInsets.only(bottom: deviceSize.height * 0.05),
                    child: SvgPicture.asset('assets/images/011_planet.svg'),
                  ),
                  Positioned(
                    left: deviceSize.width * 0.22,
                    top: deviceSize.height * 0.23,
                    child: Container(
                        height: deviceSize.height * 0.18,
                        width: deviceSize.width * 0.18,
                        child: SvgPicture.asset('assets/images/012_car.svg')),
                  ),
                  Positioned(
                    left: deviceSize.width * 0.4,
                    top: deviceSize.height * 0.28,
                    child: Container(
                        height: deviceSize.height * 0.18,
                        width: deviceSize.width * 0.18,
                        child: heroController),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
