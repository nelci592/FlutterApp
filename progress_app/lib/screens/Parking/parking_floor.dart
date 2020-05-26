import 'package:flutter/material.dart';
import 'package:progress_app/models/parking_floor_state.dart';

class ParkingFloor extends StatefulWidget {
  final ParkingFloorState status;
  final String floorName;

  ParkingFloor({Key key, this.status, this.floorName}) : super(key: key);

  @override
  _ParkingFloorState createState() => _ParkingFloorState();
}

class _ParkingFloorState extends State<ParkingFloor> {
  LinearGradient getGradient() {
    if (widget.status == ParkingFloorState.available) {
      return LinearGradient(
        colors: [
          Color.fromRGBO(111, 198, 25, 1),
          Color.fromRGBO(159, 235, 83, 1)
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );
    } else if (widget.status == ParkingFloorState.almostFull) {
      return LinearGradient(
        colors: [
          Color.fromRGBO(255, 171, 88, 1),
          Color.fromRGBO(251, 201, 88, 1)
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );
    } else {
      return LinearGradient(
        colors: [
          Color.fromRGBO(255, 88, 88, 1),
          Color.fromRGBO(251, 88, 149, 1)
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0, // has the effect of softening the shadow
            spreadRadius: 2.0, // has the effect of extending the shadow
            color: Colors.grey[400],
            offset: Offset(10, 4),
          )
        ],
      ),
      child: Container(
        child: Row(
          children: <Widget>[
            new Container(
                width: 76,
                height: 65,
                decoration: new BoxDecoration(
                    gradient: getGradient(),
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(6.0),
                        bottomLeft: const Radius.circular(6.0))),
                child: new Center(
                  child: new Text(widget.floorName,
                      style: TextStyle(color: Colors.white, fontSize: 21)),
                )),
            Expanded(
              child: new Container(
                width: 267,
                height: 65,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topRight: const Radius.circular(6.0),
                        bottomRight: const Radius.circular(6.0))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: new Text("7 available",
                        style: TextStyle(
                            color: Color.fromRGBO(50, 50, 50, 1),
                            fontSize: 14)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
