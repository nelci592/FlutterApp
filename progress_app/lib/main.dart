import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/auth.dart';
import './screens/auth_screen.dart';
import './screens/overview_screen.dart';
import './screens/success_back_to_work.dart';
import './screens/success_sharing_screen.dart';
import './screens/notfity_absence.dart';

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
                backgroundColor: Colors.green,
                primaryColor: Colors.green,
                accentColor: Colors.green,

                buttonColor: Colors.pink,
               
            cardColor: Colors.blue,
            highlightColor: Colors.red,
            splashColor: Colors.orange,
                              ),
              home: NotifyAbsence(),
           //   home: OverviewScreen(),
           //   home: SuccessBackToWork(),
             // home: SuccessSharing(),
             // home: auth.isAuth ? SuccessSharing() : AuthScreen(),
              routes: {
                SuccessSharing.routeName: (ctx) => SuccessSharing(),
                //OverviewScreen.routeName: (ctx) => OverviewScreen(),
              },
            ),
      ),
    );
  }
}
