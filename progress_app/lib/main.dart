// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:progress_app/screens/terminate_absence.dart';
// import 'package:provider/provider.dart';
// import './providers/auth.dart';
// import './screens/auth_screen.dart';
// import './screens/overview_screen.dart';
// import './screens/success_back_to_work.dart';
// import './screens/success_sharing_screen.dart';
// import './screens/notfity_absence.dart';
// import './screens/terminate_absence.dart';
// import './screens/onboarding_screen.dart';
// import './screens/home_screen.dart';

// // void main() {
// //   runApp(new MaterialApp(
// //     home: new SplashScreen(),
// //     routes: <String, WidgetBuilder>{
// //       '/HomeScreen': (BuildContext context) => new HomeScreen()
// //     },
// //   ));
// // }

// // class SplashScreen extends StatefulWidget {
// //   @override
// //   _SplashScreenState createState() => new _SplashScreenState();
// // }

// // class _SplashScreenState extends State<SplashScreen> {
// //   startTime() async {
// //     var _duration = new Duration(seconds: 2);
// //     return new Timer(_duration, navigationPage);
// //   }

// //   void navigationPage() {
// //     Navigator.of(context).pushReplacementNamed('/HomeScreen');
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     startTime();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return new Scaffold(
// //       body: new Center(
// //         child: new Image.asset('images/first.png'),
// //       ),
// //     );
// //   }
// // }


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



import 'package:flutter_svg/svg.dart';
//SvgPicture.asset( 'assets/images/002_onboarding_games.svg',)

import 'package:flutter/material.dart';

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
    var decoratedBox = new DecoratedBox(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.fitWidth,
            image: new AssetImage('assets/images/test.png'),
          ),
          shape: BoxShape.circle,
        )
    );

    // hero top left
    var hero = new Hero(
      tag: 'hero-tag-llama',
      child: decoratedBox,
    );

    var _children = <Widget>[
      new Container(
        height: 250.0,
        width: 250.0,
        child: hero,
      ),
    ];

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(children: _children),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onPressed,
        tooltip: 'Increment',
        child: new Icon(Icons.done),
      ),);
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
    // llama Image
    var decoratedBox = new DecoratedBox(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.fitWidth,
            image: new AssetImage('assets/images/test.png'),
          ),
          shape: BoxShape.circle,
        )
    );

    // hero center
    var hero = new Hero(
      tag: 'hero-tag-llama',
      child: decoratedBox,
    );

    var center = new Center(
      child: new Container(
        height: 50.0,
        width: 50.0,
        child: hero,
      ),);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: center,
    );
  }
}