import 'package:flutter/material.dart';
import 'package:progress_app/screens/splash.dart';
import './screens/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:progress_app/screens/Parking/parking_screen.dart';
import './screens/auth/auth_screen.dart';
//  import './screens/splash.dart';
// import 'models/UserData/parking_global_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          // Use the old theme but apply the following three changes
          textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Segoe',
              bodyColor: Colors.black,
              displayColor: Colors.white),
          primaryColor: Colors.white,
          accentColor: Colors.green,
        ),
        home: SplashScreen(),
        // AuthScreen()
        // Scaffold(
        //     body: StreamBuilder(
        //         stream: FirebaseAuth.instance.onAuthStateChanged,
        //         builder: (ctx, userSnapshot) {
        //           if (userSnapshot.hasData) {
        //             return ParkingView();
        //           }
        //           return AuthScreen();
        //         }),
  );
  
  }
}
