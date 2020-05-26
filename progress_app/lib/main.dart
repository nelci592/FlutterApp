import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:progress_app/screens/Parking/parking_screen.dart';
import './screens/auth/auth_screen.dart';
// import './screens/splash.dart';
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
        home: Scaffold(
            // appBar: AppBar(
            //   elevation: 0.0,
            //   backgroundColor: Colors.white,
            //   leading: Builder(
            //     builder: (BuildContext context) {
            //       return IconButton(
            //         icon: const Icon(Icons.menu),
            //         color: Colors.black,
            //         onPressed: () {
            //           Scaffold.of(context).openDrawer();
            //         },
            //         tooltip: 
            //             MaterialLocalizations.of(context).openAppDrawerTooltip,
            //       );
            //     },
            //   ),
            //   actions: <Widget>[
            //     IconButton(
            //       icon: Icon(Icons.notifications_none),
            //       onPressed: () {},
            //       color: Colors.black,
            //     )
            //   ],
            // ),
            // body: ParkingView(
            //     sharedSpaces: ParkingGlobalData.getSharedSpaces()),


            body: StreamBuilder(
                stream: FirebaseAuth.instance.onAuthStateChanged,
                builder: (ctx, userSnapshot) {
                  if (userSnapshot.hasData) {
                    return ParkingView();
                  }
                  return AuthScreen();
                }),

                
            //  body: SplashScreen(),
            // drawer: ClipRRect(
            //   borderRadius: BorderRadius.only(topRight: Radius.circular(80.0)),
            //   child: Drawer(
            //     child: ListView(
            //       padding: EdgeInsets.zero,
            //       children: <Widget>[
            //         DrawerHeader(
            //           child: Center(
            //             child: Text('Drawer Header',
            //                 style:
            //                     TextStyle(fontFamily: "Segoe", fontSize: 21)),
            //           ),
            //           decoration: BoxDecoration(
            //             gradient: LinearGradient(
            //               colors: [
            //                 Color.fromRGBO(111, 198, 25, 1),
            //                 Color.fromRGBO(159, 235, 83, 1)
            //               ],
            //               begin: Alignment.topCenter,
            //               end: Alignment.bottomCenter,
            //             ),
            //           ),
            //         ),
            //         ListTile(
            //           title: Text('Parking'),
            //           leading: SvgPicture.asset(
            //             'assets/images/04_parking.svg',
            //             width: 24,
            //             height: 24,
            //           ),
            //           onTap: () {
            //             // Update the state of the app.
            //             // ...
            //           },
            //         ),
            //         ListTile(
            //           title: Text('Play Area'),
            //           leading: SvgPicture.asset(
            //             'assets/images/05_games.svg',
            //             width: 24,
            //             height: 24,
            //           ),
            //           onTap: () {
            //             // Update the state of the app.
            //             // ...
            //           },
            //         ),
            //         ListTile(
            //           title: Text('Dancing lessons'),
            //           leading: SvgPicture.asset(
            //             'assets/images/06_lessons.svg',
            //             width: 24,
            //             height: 24,
            //           ),
            //           onTap: () {
            //             // Update the state of the app.
            //             // ...
            //           },
            //         ),
            //         Container(
            //           padding: EdgeInsets.only(top: 250),
            //           child: ListTile(
            //             title: Text('Log out'),
            //             leading: SvgPicture.asset(
            //               'assets/images/07_log_out.svg',
            //               width: 24,
            //               height: 24,
            //             ),
            //             onTap: () {
            //               FirebaseAuth.instance.signOut();
            //               Scaffold.of(context).openEndDrawer();
            //             },
            //           ),
            //         )
            //         // ListTile(
            //         //   title: Text('Parking'),
            //         //   leading: Icon(
            //         //     Icons.local_parking,
            //         //     color: Colors.black,
            //         //     size: 24.0,
            //         //     semanticLabel:
            //         //         'Text to announce in accessibility modes',
            //         //   ),
            //         //   onTap: () {
            //         //     // Update the state of the app.
            //         //     // ...
            //         //   },
            //         // ),
            //         // ListTile(
            //         //   title: Text('Play Area'),
            //         //   leading: Icon(
            //         //     Icons.games,
            //         //     color: Colors.black,
            //         //     size: 24.0,
            //         //     semanticLabel:
            //         //         'Text to announce in accessibility modes',
            //         //   ),
            //         //   onTap: () {
            //         //     // Update the state of the app.
            //         //     // ...
            //         //   },
            //         // ),
            //         // ListTile(
            //         //   title: Text('Dancing Lessons'),
            //         //   leading: Icon(
            //         //     Icons.school,
            //         //     color: Colors.black,
            //         //     size: 24.0,
            //         //     semanticLabel:
            //         //         'Text to announce in accessibility modes',
            //         //   ),
            //         //   onTap: () {
            //         //     // Update the state of the app.
            //         //     // ...
            //         //   },
            //         // )
            //       ],
            //     ),
            //   ),
            // ))
    //  child: Consumer<Auth>(
    //   builder: (ctx, auth, _) => MaterialApp(
    //         title: 'Progress App',
    //         theme: ThemeData(
    //           fontFamily: 'Segoe',
    //         ),
    //         home: auth.isAuth ? OverviewScreen() : AuthScreen(),
    //         routes: {
    //           OverviewScreen.routeName: (ctx) => OverviewScreen(),
    //         },
    //       ),
    // ),
  ));
  }
}
