import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessBackToWork extends StatelessWidget {
  static const routeName = '/successbacktowork';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    //final String successImage = "images/pictures/09_confirmation_star.svg";

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
                      child: SvgPicture.string(
                        '''<svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><defs><style>.cls-1{fill:#010101;}</style></defs><title>10_confirmation_medal</title><path id="confirmation_medal" class="cls-1" d="M227.78,146.41,167.29,45.6a28,28,0,0,0-24-13.6H46A14,14,0,0,0,34.55,54l97.37,139.09a181.06,181.06,0,0,1,95.86-46.71ZM466,32H368.72a28,28,0,0,0-24,13.6L284.22,146.41a181.11,181.11,0,0,1,95.86,46.7L477.45,54A14,14,0,0,0,466,32ZM256,172A154,154,0,1,0,410,326,154,154,0,0,0,256,172Zm81,137.6-33.19,32.34,7.85,45.7a10,10,0,0,1-14.57,10.57L256,376.65l-41,21.56a10,10,0,0,1-14.57-10.57l7.85-45.7L175.05,309.6a10.05,10.05,0,0,1,5.56-17.14l45.88-6.68L247,244.2a9.87,9.87,0,0,1,9-5.6,10,10,0,0,1,9,5.6l20.5,41.58,45.88,6.68A10.05,10.05,0,0,1,337,309.6Z"/></svg>''',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: deviceSize.height * 0.78,
                    child: Text("Back to work confirmed!",
                        style: TextStyle(
                          color: Color.fromRGBO(50, 50, 50, 1),
                          fontSize: 30,
                          fontFamily: "Segoe",
                        )),
                  ),
                  Positioned(
                    top: deviceSize.height * 0.85,
                    child:
                        Text("A big THANK YOU for sharing your parking spot.",
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
