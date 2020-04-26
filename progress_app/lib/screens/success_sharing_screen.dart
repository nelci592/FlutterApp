import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessSharing extends StatelessWidget {
  static const routeName = '/successsharing';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

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
              Stack(
                children: <Widget>[
                  Container(
                    width: deviceSize.width * 0.8,
                    height: deviceSize.height * 0.9,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(159, 235, 83, 0.5)),
                  ),
                  Positioned(
                    left: deviceSize.width * 0.1,
                    top: deviceSize.height * 0.15,
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
                    top: deviceSize.height * 0.25,
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
                    top: deviceSize.height * 0.35,
                    child: Container(
                      width: deviceSize.width * 0.2,
                      height: deviceSize.height * 0.2,
                      child: SvgPicture.asset(
                        'assets/images/star.svg',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: deviceSize.height * 0.78,
                    left: deviceSize.width * 0.15,
                    right: deviceSize.width * 0.15,
                    child: Text("You are a star!",
                        style: TextStyle(
                          color: Color.fromRGBO(50, 50, 50, 1),
                          fontSize: 30,
                          fontFamily: "Segoe",
                        )),
                  ),
                  Positioned(
                    top: deviceSize.height * 0.85,
                    child: Text("Now your collegues can use your parking spot.",
                        style: TextStyle(
                          color: Color.fromRGBO(50, 50, 50, 1),
                          fontSize: 15,
                          fontFamily: "Segoe",
                          //  decoration: TextDecoration.none
                        )),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
