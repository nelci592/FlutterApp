import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/UserData/user_global_data.dart';
import '../confirmation/success_sharing_screen.dart';

class NotifyAbsence extends StatefulWidget {
  static const routeName = '/notifyabsence';

  @override
  _NotifyAbsenceState createState() => _NotifyAbsenceState();
}

class _NotifyAbsenceState extends State<NotifyAbsence> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 1));
  bool isSpaceShared = GlobalUserData.isSpaceShared;


  void _notify() async {
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser();
    final email = user.email.toString();
    String name;
    int number;

    final alldocuments = await Firestore.instance
        .collection("park owners")
        .where("emailOfOwner", isEqualTo: email)
        .getDocuments();

    void _getName() async {
      alldocuments.documents.forEach((res) {
        name = res.data["nameOfOwner"];
        return name;
      });
    }

    void _getSpotNumber() async {
      alldocuments.documents.forEach((res) {
        number = res.data["spotNumber"];
        return number;
      });
    }

    _getName();
    _getSpotNumber();

    Firestore.instance.collection('absences').add({
      'nameOfOwner': name,
      'spotNumber': number,
      'startDate': _startDate,
      'endDate':_endDate,
      'emailOfOwner' : email
    });

     setState(() {
      return isSpaceShared= true;
    });
    
  }

  Future displayDateRangePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRangePicker.showDatePicker(
        context: context,
        initialFirstDate: _startDate,
        initialLastDate: _endDate,
        firstDate: DateTime.now().subtract(Duration(days: 1)),
        lastDate: new DateTime(DateTime.now().year + 1));
    if (picked != null && picked.length == 2) {
      setState(() {
        _startDate = picked[0];
        _endDate = picked[1];
      });
    }
  }

  static int _fullAlpha = 255;
  static Color green = new Color.fromARGB(_fullAlpha, 59, 178, 115);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
   // final data = Data(isSpaceShared);
    return Material(
      type: MaterialType.transparency,
      child: Theme(
          data: Theme.of(context).copyWith(
              textTheme: Theme.of(context).textTheme.apply(
                  displayColor: Colors.black), //  primaryColor: Colors.grey,
              buttonTheme: ButtonThemeData(
                  buttonColor: Colors.green,
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                        primary: green,
                      ),
                  textTheme: ButtonTextTheme.normal)),
          child: Builder(
            builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                      "Start Date: ${DateFormat('dd/MM/yyyy').format(_startDate).toString()}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(50, 50, 50, 1),
                        fontSize: 20,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Text(
                      "End Date: ${DateFormat('dd/MM/yyyy').format(_endDate).toString()}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(50, 50, 50, 1),
                        fontSize: 20,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 55),
                  child: Container(
                    width: deviceSize.width * 0.9,
                    child: Container(
                      height: 40.0,
                      child: RaisedButton(
                        onPressed: () async {
                          await displayDateRangePicker(context);
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
                            constraints: BoxConstraints(
                                maxWidth: 400.0, minHeight: 40.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Select Dates",
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 40.0,
                    width: deviceSize.width * 0.9,
                    child: RaisedButton(
                      onPressed: () {
                        _notify();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SuccessSharing()),
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
                              BoxConstraints(maxWidth: 400.0, minHeight: 40.0),
                          alignment: Alignment.center,
                          child: Text(
                            "Confirm",
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
          )),
    );
  }
}
