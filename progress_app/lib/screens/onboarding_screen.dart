import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:progress_app/screens/Parking/parking_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: deviceSize.height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ParkingView()));
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: deviceSize.height * 0.75,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(deviceSize.width * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Find a parking spot",
                                style: TextStyle(
                                  color: Color.fromRGBO(50, 50, 50, 1),
                                  fontSize: 30,
                                )),
                            Container(
                              padding: EdgeInsets.all(deviceSize.height * 0.04),
                              child: Text(
                                  "It is long extablished fact that a reader will be distracted by the readable content....",
                                  style: TextStyle(
                                    color: Color.fromRGBO(50, 50, 50, 1),
                                    fontSize: 14,
                                  )),
                            ),
                            SvgPicture.asset(
                              'assets/images/001_onboarding_parking.svg',
                              height: deviceSize.height * 0.5,
                              width: deviceSize.width * 0.8,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(deviceSize.width * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Book a game slot",
                                style: TextStyle(
                                  color: Color.fromRGBO(50, 50, 50, 1),
                                  fontSize: 30,
                                )),
                            Container(
                              padding: EdgeInsets.all(deviceSize.height * 0.04),
                              child: Text(
                                  "It is long extablished fact that a reader will be distracted by the readable content....",
                                  style: TextStyle(
                                    color: Color.fromRGBO(50, 50, 50, 1),
                                    fontSize: 14,
                                  )),
                            ),
                            SvgPicture.asset(
                              'assets/images/002_onboarding_games.svg',
                              height: deviceSize.height * 0.5,
                              width: deviceSize.width * 0.8,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(deviceSize.width * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Book a dance lesson",
                                style: TextStyle(
                                  color: Color.fromRGBO(50, 50, 50, 1),
                                  fontSize: 30,
                                )),
                            Container(
                              padding: EdgeInsets.all(deviceSize.height * 0.04),
                              child: Text(
                                  "It is long extablished fact that a reader will be distracted by the readable content....",
                                  style: TextStyle(
                                    color: Color.fromRGBO(50, 50, 50, 1),
                                    fontSize: 14,
                                  )),
                            ),
                            SvgPicture.asset(
                              'assets/images/003_onboarding_lessons.svg',
                              height: deviceSize.height * 0.5,
                              width: deviceSize.width * 0.8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              color: Colors.white,
              height: deviceSize.height * 0.12,
              width: deviceSize.width,
              padding: EdgeInsets.fromLTRB(
                  deviceSize.width * 0.1,
                  deviceSize.height * 0.025,
                  deviceSize.width * 0.1,
                  deviceSize.height * 0.03),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ParkingView()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(111, 198, 25, 1),
                          Color.fromRGBO(159, 235, 83, 1)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 400.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Get Started",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
