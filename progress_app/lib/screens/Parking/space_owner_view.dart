import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../../models/UserData/user_global_data.dart';

class NotifySpaceAvailableView extends StatefulWidget {
  final GlobalUserData model;

  NotifySpaceAvailableView({Key key, this.model}) : super(key: key);

  @override
  _NotifySpaceAvailableViewState createState() =>
      _NotifySpaceAvailableViewState();
}

class _NotifySpaceAvailableViewState extends State<NotifySpaceAvailableView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => NotifyAbsence()),
          // );
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
            constraints: BoxConstraints(maxWidth: 400.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              "Notify Absence",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
    //  Container(
    //   height: 48,
    //   width: MediaQuery.of(context).size.width,
    //   decoration: new BoxDecoration(
    //       gradient: LinearGradient(
    //         colors: [
    //           Color.fromRGBO(111, 198, 25, 1),
    //           Color.fromRGBO(159, 235, 83, 1)
    //         ],
    //         begin: Alignment.centerLeft,
    //         end: Alignment.centerRight,
    //       ),
    //       borderRadius: BorderRadius.all(Radius.circular(6.0))),
    //   child: Center(
    //       child: GestureDetector(
    //     onTap: () => {
    //       //show time picker and select dates of absence
    //       GlobalUserData.isSpaceShared = true,
    //       widget.model.onDataChanged()
    //     },
    //     child: Text(
    //       "Notify Absence",
    //       style:
    //           TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 18),
    //     ),
    //   )),
    // );
  }
}
