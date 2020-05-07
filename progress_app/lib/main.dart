import 'package:flutter/material.dart';
import 'package:progress_app/screens/notfity_absence.dart';
import 'package:progress_app/screens/splash.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';
import './screens/auth_screen.dart';
import './screens/overview_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
       child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
              title: 'Progress App',
              theme: ThemeData(
                fontFamily: 'Segoe',
                 primaryColor: Colors.white,
                 accentColor: Colors.green,
              ),
              home: SplashScreen(),
              //home: auth.isAuth ? OverviewScreen() : AuthScreen(),
              routes: {
                OverviewScreen.routeName: (ctx) => OverviewScreen(),
              },
            ),
      ),
    );
  }
}
