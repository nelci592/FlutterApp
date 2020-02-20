import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SuccessSharing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final String successImage = "images/pictures/09_confirmation_star.svg";
    final Widget svg = SvgPicture.string(
      '''<svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><defs><style>.cls-1{fill:#010101;}</style></defs><title>09_confirmation_star</title><path id="confirmation_star" class="cls-1" d="M326,172l23.36-46.63L396,102,349.35,78.64,326,32,302.63,78.64,256,102l46.63,23.36Zm126,28-14-28-14,28-28,14,28,14,14,28,14-28,28-14ZM350.75,265.88l-91.69-13.39-41-83.3a20.09,20.09,0,0,0-36.05,0l-41,83.3-91.7,13.39a20.09,20.09,0,0,0-11.11,34.3l66.41,64.74L88.79,456.44c-2.8,16.54,14.61,29,29.14,21.18L200,434.4l82.07,43.22a20.09,20.09,0,0,0,29.14-21.18l-15.67-91.52L362,300.18C373.85,288.54,367.2,268.24,350.75,265.88Z"/></svg>'''
    );
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
                left: deviceSize.width * 0.4,
                top: deviceSize.height * 0.4,
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
                left: deviceSize.width * 0.5,
                top: deviceSize.height * 0.5,
                child: Container(
                  width: deviceSize.width * 0.1,
                  height: deviceSize.height * 0.1,
                child: svg,
                ),
              ),
            ],
          ),
          //09_confirmation_star.svg

          Container(
            child: Text("You are a star!",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(50, 50, 50, 1),
                  fontSize: 30,
                  fontFamily: "Segoe",
                  decoration: TextDecoration.none,
                )),
          ),
          Text("Now your collegues can use your parking spot.",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(50, 50, 50, 1),
                  fontSize: 18,
                  fontFamily: "Segoe",
                  decoration: TextDecoration.none)),
        ],
      ),
    );
  }
}
