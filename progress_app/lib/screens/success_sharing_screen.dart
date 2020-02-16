import 'package:flutter/material.dart';

class SuccessSharing extends StatelessWidget {
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
                width: 272,
                height: 272,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(159, 235, 83, 0.5)),
              ),
              Positioned(
                left: 32,
                top: 32,
                child: Container(
                  width: 208,
                  height: 208,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(111, 198, 25, 0.3)),
                ),
              ),
              Positioned(
                top: 64,
                left: 64,
                child: Container(
                  width: 144,
                  height: 144,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 26, 0, 0),
            child: Text("You are a star!",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(50, 50, 50, 1),
                  fontSize: 30,
                  fontFamily: "Segoe",
                )),
          ),
          Text("Now your collegues can use your parking spot.",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(50, 50, 50, 1),
                fontSize: 18,
                fontFamily: "Segoe",
              )),
        ],
      ),
    );
  }
}
