import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'package:progress_app/screens/Parking/parking_screen.dart';

class SuccessBackToWork extends StatelessWidget {
  static const routeName = '/successbacktowork';
   @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
       Timer(
        Duration(milliseconds: 1500),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => ParkingView())));
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
              Stack(
                children: <Widget>[
                  Container(
                    width: deviceSize.width * 0.8,
                    height: deviceSize.height * 0.7,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(159, 235, 83, 0.5)),
                  ),
                  Positioned(
                    left: deviceSize.width * 0.1,
                    top: deviceSize.height * 0.05,
                    child: Container(
                      width: deviceSize.width * 0.6,
                      height: deviceSize.height * 0.6,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(111, 198, 25, 0.3)),
                    ),
                  ),
                  Positioned(
                    left: deviceSize.width * 0.2,
                    top: deviceSize.height * 0.15,
                    child: Container(
                      width: deviceSize.width * 0.4,
                      height: deviceSize.height * 0.4,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(111, 198, 25, 1),
                              Color.fromRGBO(159, 235, 83, 1)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          shape: BoxShape.circle,
                          color: Colors.lightBlue),
                    ),
                  ),
                  Positioned(
                    left: deviceSize.width * 0.3,
                    top: deviceSize.height * 0.25,
                    child: Container(
                      width: deviceSize.width * 0.2,
                      height: deviceSize.height * 0.2,
                      child: SvgPicture.asset(
                         'assets/images/10_confirmation_medal.svg',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Text("Back to work confirmed!",
                  style: TextStyle(
                    color: Color.fromRGBO(50, 50, 50, 1),
                    fontSize: 30,
                    fontFamily: "Segoe",
                  )),
              Text("A big THANK YOU for sharing your parking spot.",
                  style: TextStyle(
                    color: Color.fromRGBO(50, 50, 50, 1),
                    fontSize: 15,
                    fontFamily: "Segoe",
                  )),
            ],
          ),
        ));
  }
}