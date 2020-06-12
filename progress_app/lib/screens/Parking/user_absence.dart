import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../confirmation/success_back_to_work.dart';

class UserAbsence extends StatefulWidget {
  @override
  _UserAbsenceState createState() => _UserAbsenceState();
}

class _UserAbsenceState extends State<UserAbsence> {
  FirebaseUser currentUser;
  String email;
  DateTime startDate;
  DateTime endDate;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  _getUserData() async {
    Firestore.instance
        .collection("absences")
        .where("emailOfOwner", isEqualTo: email)
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        startDate = result.data["startDate"].toDate();
        endDate = result.data['endDate'].toDate();
      });
    });
  }

  void terminate() async {
    final user = await FirebaseAuth.instance.currentUser();
    email = user.email.toString();

    Firestore.instance
        .collection("absences")
        .where("emailOfOwner", isEqualTo: email)
        .getDocuments()
        .then((snapshot) {
      snapshot.documents.first.reference.delete();
    });
    getEmail() {
      return email;
    }

    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Text("You are sharing your parking spot from ",
                style: TextStyle(
                  fontSize: 15,
                )),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(60, 10, 0, 0),
              child: Row(children: <Widget>[
                Text(
                    "${DateFormat('dd/MM/yyyy').format(startDate).toString()} ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text("untill ",
                    style: TextStyle(
                      fontSize: 15,
                    )),
                Text("${DateFormat('dd/MM/yyyy').format(endDate).toString()}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ])),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 45.0,
              width: 500,
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
                        BoxConstraints(maxWidth: 400.0, minHeight: 45.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Terminate absence",
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
    );
  }
}