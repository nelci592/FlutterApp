import 'package:flutter/material.dart';
import 'dart:async';
import 'package:progress_app/screens/terminate_absence.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';
import './screens/auth_screen.dart';
import './screens/overview_screen.dart';
import './screens/success_back_to_work.dart';
import './screens/success_sharing_screen.dart';
import './screens/notfity_absence.dart';
import './screens/terminate_absence.dart';
import './screens/onboarding_screen.dart';
import './screens/home_screen.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider.value(
//           value: Auth(),
//         ),
//       ],
//       child: Consumer<Auth>(
//         builder: (ctx, auth, _) => MaterialApp(
//           title: 'Progress App',
//           theme: ThemeData(
//             fontFamily: 'Segoe',
//             primaryColor: Colors.white,
//             accentColor: Colors.green,
//           ),
//             home: HomeScreen(),
//           //   home: OverviewScreen(),
//           //   home: SuccessBackToWork(),
//           // home: SuccessSharing(),
//           // home: auth.isAuth ? SuccessSharing() : AuthScreen(),
//           routes: {
//             SuccessSharing.routeName: (ctx) => SuccessSharing(),
//             SuccessBackToWork.routeName: (ctx) => SuccessBackToWork(),
//             //OverviewScreen.routeName: (ctx) => OverviewScreen(),
//           },
//         ),
//       ),
//     );
//   }
// }

void main() {
  runApp(new MyApp());
}

/// Root MaterialApp
class MyApp extends StatelessWidget {
  var _routes = <String, WidgetBuilder>{
    "/anotherPage": (BuildContext context) =>
        new AnotherPage(title: "Another Page"),
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Home Page'),
      routes: _routes,
    );
  }
}

/// place: "/"
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              height: deviceSize.height * 0.6,
              width: deviceSize.width * 0.8,
              child: hero,
            ),
            RaisedButton(
              onPressed: () {
                _onPressed();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onPressed() {
    Navigator.of(context).pushNamed("/anotherPage");
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
