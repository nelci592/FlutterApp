import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';
import './auth_screen.dart';

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
        Duration(seconds: 2),
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
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.bottomRight,
        //         end: Alignment.topLeft,
        //         stops: [
        //       0.4,
        //       0.6,
        //       0.9
        //     ],
        //         colors: [
        //       Color.fromRGBO(111, 198, 25, 1),
        //       Color.fromRGBO(159, 235, 83, 1),
        //       Color.fromRGBO(132, 214, 50, 1),
        //     ])),
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
        Duration(milliseconds: 1),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => SecondPage())));

    var decoratedBoxLogo = new DecoratedBox(
        decoration: new BoxDecoration(
      image: new DecorationImage(
        fit: BoxFit.fitWidth,
        image: new AssetImage('assets/images/progress.png'),
      ),
      shape: BoxShape.circle,
    ));

    // hero center
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
                padding: EdgeInsets.only(top: deviceSize.height * 0.7),
                height: deviceSize.height * 0.01,
                width: deviceSize.width * 0.01,
                child: heroPlanet,
              ),
            ]),
      ),
    );
  }
}

// place: "/anotherPage"
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
        Duration(seconds: 1),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => ThirdPage())));

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
                    left: deviceSize.width * 0.1,
                    top: deviceSize.height * 0.05,
                    child: Container(
                        height: deviceSize.height * 0.02,
                        width: deviceSize.width * 0.02,
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

// place: "/anotherPage"
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
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => ForthPage())));

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
                    left: deviceSize.width * 0.1,
                    top: deviceSize.height * 0.17,
                    child: Container(
                        height: deviceSize.height * 0.18,
                        width: deviceSize.width * 0.18,
                        child: heroCar),
                  ),
                  Positioned(
                    left: deviceSize.width * 0.8,
                    top: deviceSize.height * 0.35,
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

// place: "/anotherPage"
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
        Duration(seconds: 1),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => AfterForthPage())));

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
                    left: deviceSize.width * 0.7,
                    top: deviceSize.height * 0.375,
                    child: Container(
                        height: deviceSize.height * 0.15,
                        width: deviceSize.width * 0.15,
                        child: SvgPicture.asset('assets/images/012_car.svg')),),
                 Positioned(
                    left: deviceSize.width * 0.7,
                    top: deviceSize.height * 0.26,
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

class AfterForthPage extends StatefulWidget {
  AfterForthPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AfterForthPageState createState() => new _AfterForthPageState();
}

class _AfterForthPageState extends State<AfterForthPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    Timer(
        Duration(seconds: 1),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => FifthPage())));

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
                    left: deviceSize.width * 0.7,
                    top: deviceSize.height * 0.375,
                    child: Container(
                        height: deviceSize.height * 0.15,
                        width: deviceSize.width * 0.15,
                        child: SvgPicture.asset('assets/images/012_car.svg')),),
                 Positioned(
                    left: deviceSize.width * 0.7,
                    top: deviceSize.height * 0.26,
                    child: Container(
                        height: deviceSize.height * 0.2,
                        width: deviceSize.width * 0.2,
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


// place: "/anotherPage"
class FifthPage extends StatefulWidget {
  FifthPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FifthPageState createState() => new _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    Timer(
        Duration(seconds: 1),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => SixthPage())));


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
                    left: deviceSize.width * 0.7,
                    top: deviceSize.height * 0.375,
                    child: Container(
                        height: deviceSize.height * 0.15,
                        width: deviceSize.width * 0.15,
                        child: SvgPicture.asset('assets/images/012_car.svg')),
                  ),
                  Positioned(
                    left: deviceSize.width * 0.3,
                    top: deviceSize.height * 0.28,
                    child: Container(
                        height: deviceSize.height * 0.17,
                        width: deviceSize.width * 0.17,
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

// place: "/anotherPage"
class SixthPage extends StatefulWidget {
  SixthPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SixthPageState createState() => new _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    Timer(
        Duration(seconds: 1),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => AuthScreen())));


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
                    left: deviceSize.width * 0.7,
                    top: deviceSize.height * 0.375,
                    child: Container(
                        height: deviceSize.height * 0.15,
                        width: deviceSize.width * 0.15,
                        child: SvgPicture.asset('assets/images/012_car.svg')),
                  ),
                  Positioned(
                    left: deviceSize.width * 0.11,
                    top: deviceSize.height * 0.25,
                    child: Container(
                        height: deviceSize.height * 0.15,
                        width: deviceSize.width * 0.15,
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
