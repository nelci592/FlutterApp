import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:progress_app/models/parking_floor_state.dart';
import 'package:progress_app/screens/Parking/parking_floor.dart';

class SecondFloorInfo extends StatefulWidget {
  @override
  _SecondFloorInfoState createState() => _SecondFloorInfoState();
}

class _SecondFloorInfoState extends State<SecondFloorInfo> {
  int numberSecondFloor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection('second floor')
                .where("state", isEqualTo: "available")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              numberSecondFloor = snapshot.data.documents.length;
              return ParkingFloor(
                status: (numberSecondFloor >= 7)
                    ? ParkingFloorState.available
                    : ((numberSecondFloor == 0)
                        ? ParkingFloorState.full
                        : ParkingFloorState.almostFull),
                floorName: "P2",
                numberAvailble: numberSecondFloor,
              );
            }));
  }
}
