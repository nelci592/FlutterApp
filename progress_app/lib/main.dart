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
import './screens/splash.dart';
import 'homeScreen.dart';

void main() {
  runApp(new MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new HomeScreen()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset('images/first.png'),
      ),
    );
  }
}


//void main() => runApp(MyApp());

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
//           home: StartScreen(),
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
