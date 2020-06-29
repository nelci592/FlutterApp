import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:progress_app/models/parking_floor_state.dart';
import 'package:progress_app/screens/Parking/parking_floor.dart';

class FirstFloorInfo extends StatefulWidget {
  @override
  _FirstFloorInfoState createState() => _FirstFloorInfoState();
}

class _FirstFloorInfoState extends State<FirstFloorInfo> {
  int numberFirstFloor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection('absences')
                .where("state", isEqualTo: "available")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              numberFirstFloor = snapshot.data.documents.length;
              return ParkingFloor(
                status: (numberFirstFloor >= 7)
                    ? ParkingFloorState.available
                    : ((numberFirstFloor == 0)
                        ? ParkingFloorState.full
                        : ParkingFloorState.almostFull),
                floorName: "P1",
                numberAvailble: numberFirstFloor,
              );
            }));
  }
}
