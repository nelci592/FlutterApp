import 'package:flutter/material.dart';
import 'package:progress_app/screens/terminate_absence.dart';
import 'package:provider/provider.dart';

import './providers/auth.dart';
import './screens/auth_screen.dart';
import './screens/overview_screen.dart';
import './screens/success_back_to_work.dart';
import './screens/success_sharing_screen.dart';
import './screens/notfity_absence.dart';
import './screens/terminate_absence.dart';

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
          home: NotifyAbsence(),
          //   home: OverviewScreen(),
          //   home: SuccessBackToWork(),
          // home: SuccessSharing(),
          // home: auth.isAuth ? SuccessSharing() : AuthScreen(),
          routes: {
            SuccessSharing.routeName: (ctx) => SuccessSharing(),
            SuccessBackToWork.routeName: (ctx) => SuccessBackToWork(),
            //OverviewScreen.routeName: (ctx) => OverviewScreen(),
          },
        ),
      ),
    );
  }
}
