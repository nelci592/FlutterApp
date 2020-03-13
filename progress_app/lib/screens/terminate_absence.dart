import 'package:flutter/material.dart';
import 'package:progress_app/screens/success_back_to_work.dart';
class TerminateAbsence extends StatefulWidget {
  @override
  _TerminateAbsenceState createState() => _TerminateAbsenceState();
}

class _TerminateAbsenceState extends State<TerminateAbsence> {
void terminate(){

}

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
              Container(
                padding: EdgeInsets.fromLTRB(0, deviceSize.height * 0.2, 0, 0),
                child: Text("Terminate absence",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(50, 50, 50, 1),
                      fontSize: 30,
                    )),
              ),
              
              Container(
                padding: EdgeInsets.fromLTRB(0, deviceSize.height * 0.3, 0, 0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                     onPressed: () {
                      terminate();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessBackToWork()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
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
                          "Select dates",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
