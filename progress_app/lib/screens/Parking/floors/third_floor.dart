import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:progress_app/models/parking_floor_state.dart';
import 'package:progress_app/screens/Parking/parking_floor.dart';

class ThirdFloorInfo extends StatefulWidget {
  @override
  _ThirdFloorInfoState createState() => _ThirdFloorInfoState();
}

class _ThirdFloorInfoState extends State<ThirdFloorInfo> {
  int numberThirdFloor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection('third floor')
                .where("state", isEqualTo: "available")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              numberThirdFloor = snapshot.data.documents.length;
              return ParkingFloor(
                status: (numberThirdFloor >= 7)
                    ? ParkingFloorState.available
                    : ((numberThirdFloor == 0)
                        ? ParkingFloorState.full
                        : ParkingFloorState.almostFull),
                floorName: "P3",
                numberAvailble: numberThirdFloor,
              );
            }));
  }
}
