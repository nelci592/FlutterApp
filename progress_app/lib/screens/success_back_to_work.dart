import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessBackToWork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
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
                height: deviceSize.height * 0.8,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(159, 235, 83, 0.5)),
              ),
              Positioned(
                left: deviceSize.width * 0.1,
                top: deviceSize.height * 0.1,
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
                top: deviceSize.height * 0.2,
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
            ],
          ),
          
          // Padding(
          //   padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          Container(
            child: Text("Back to work confirmed",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(50, 50, 50, 1),
                  fontSize: 30,
                  fontFamily: "Segoe",
                   decoration: TextDecoration.none, 
                )),
          ),
          Text("A big THANK YOU for sharing your parking spot.",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(50, 50, 50, 1),
                fontSize: 18,
                fontFamily: "Segoe",
                 decoration: TextDecoration.none
              )),
        ],
      ),
    );
  }
}

