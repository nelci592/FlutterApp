import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Parking/parking_screen.dart';
import '../booking/book_lesson.dart';
import '../booking/book_facility.dart';


class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(80.0)),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text('Drawer Header',
                    style: TextStyle(fontFamily: "Segoe", fontSize: 21)),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(111, 198, 25, 1),
                    Color.fromRGBO(159, 235, 83, 1)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            ListTile(
              title: Text('Parking'),
              leading: SvgPicture.asset(
                'assets/images/04_parking.svg',
                width: 24,
                height: 24,
              ),
              onTap: () {
              Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ParkingView()));
              },
            ),
            ListTile(
              title: Text('Play Area'),
              leading: SvgPicture.asset(
                'assets/images/05_games.svg',
                width: 24,
                height: 24,
              ),
              onTap: () {
                Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => BookFacility()));
              },
            ),
            ListTile(
                title: Text('Dancing lessons'),
                leading: SvgPicture.asset(
                  'assets/images/06_lessons.svg',
                  width: 24,
                  height: 24,
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => BookLesson()));
                }),
            Container(
              padding: EdgeInsets.only(top: 250),
              child: ListTile(
                title: Text('Log out'),
                leading: SvgPicture.asset(
                  'assets/images/07_log_out.svg',
                  width: 24,
                  height: 24,
                ),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
