import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/UserData/user_global_data.dart';
import './notfity_absence.dart';
import './available_spots.dart';
import './user_absence.dart';

class FirstFloor extends StatefulWidget {
  @override
  _FirstFloorState createState() => _FirstFloorState();
}

class _FirstFloorState extends State<FirstFloor> {
  bool isParkingSpaceOwner = true;
  bool isSpaceShared = GlobalUserData.isSpaceShared;

  FirebaseUser currentUser;
  FirebaseAuth _auth;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _getCurrentUser();
  }

  _getCurrentUser() async {
    currentUser = await _auth.currentUser();
    var result = await Firestore.instance
        .collection('/park owners')
        .orderBy("emailOfOwner")
        .getDocuments();

    setState(() {
      result.documents.forEach((res) {
        (currentUser.email.toString() == res.data['emailOfOwner'])
            ? isParkingSpaceOwner = true
            : isParkingSpaceOwner = false;
      });
      return isParkingSpaceOwner;
    });

    var resultOfAbsence = await Firestore.instance
        .collection('/absences')
        .getDocuments();

    setState(() {
      resultOfAbsence.documents.forEach((res) {
        (currentUser.email.toString() == res.data['emailOfOwner'])
            ? isSpaceShared = true
            : isSpaceShared = false;
      });
      return isSpaceShared;
    });
  }

  
  Widget buildViewByUserType() {
    if (isParkingSpaceOwner) {
      if (isSpaceShared) {
        return UserAbsence();
      } else {
        return NotifyAbsence();
      }
    } else {
      return AvailableSpots();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.transparent,
          child: Text(
            (isParkingSpaceOwner)
                ? (!isSpaceShared ? "Notify absence" : "")
                : "P1 available spots",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        Container(
            width: 690,
            height: 220,
            child: buildViewByUserType()
            // (isParkingSpaceOwner)
            //     ? (isSpaceShared ? UserAbsence() : NotifyAbsence())
            //     : AvailableSpots()
                )
      ],
    );
  }
}
