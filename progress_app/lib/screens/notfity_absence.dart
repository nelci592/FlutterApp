import 'dart:math';

import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:progress_app/screens/success_back_to_work.dart';
import 'package:progress_app/screens/success_sharing_screen.dart';
import 'dart:convert';
import '../providers/absence.dart';

class NotifyAbsence extends StatefulWidget {
  static const routeName = '/notifyabsence';

  @override
  _NotifyAbsenceState createState() => _NotifyAbsenceState();
}

class _NotifyAbsenceState extends State<NotifyAbsence> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 1));

  void notify(startDate, endDate, spot) {
    const url = 'https://testdb-83df0.firebaseio.com/dates.json';
    http.post(url,
        body: json.encode({
          'startDateAbsence': startDate,
          'endDateAbsence': endDate,
          'spotNumber': spot,
        }));
  }

  Future displayDateRangePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRangePicker.showDatePicker(
        context: context,
        initialFirstDate: _startDate,
        initialLastDate: _endDate,
        firstDate: new DateTime(DateTime.now().year - 1),
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
    return Material(
      type: MaterialType.transparency,
      child: Theme(
          data: Theme.of(context).copyWith(
              buttonTheme: ButtonThemeData(
                  highlightColor: Colors.green,
                  buttonColor: Colors.green,
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                        primary: green,
                      ),
                  textTheme: ButtonTextTheme.normal)),
          child: Builder(
              builder: (context) => Container(
                    color: Colors.white,
                    height: deviceSize.height,
                    width: deviceSize.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              0, deviceSize.height * 0.2, 0, 0),
                          child: Text("Absence dates",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(50, 50, 50, 1),
                                fontSize: 30,
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              0, deviceSize.height * 0.1, 0, 0),
                          child: Text(
                              "Start Date: ${DateFormat('dd/MM/yyyy').format(_startDate).toString()}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(50, 50, 50, 1),
                                fontSize: 20,
                              )),
                        ),
                        Container(
                          child: Text(
                              "End Date: ${DateFormat('dd/MM/yyyy').format(_endDate).toString()}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(50, 50, 50, 1),
                                fontSize: 20,
                              )),
                        ),
                        Container(
                          width: deviceSize.width * 0.9,
                          padding: EdgeInsets.fromLTRB(
                              0,
                              deviceSize.height * 0.32,
                              0,
                              deviceSize.height * 0.03),
                          child: Container(
                            height: 50.0,
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
                                      maxWidth: 400.0, minHeight: 50.0),
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
                        Container(
                          height: 50.0,
                          width: deviceSize.width * 0.9,
                          child: RaisedButton(
                            onPressed: () {
                              notify(_startDate.toString(), _endDate.toString(),
                                  2);
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
                                constraints: BoxConstraints(
                                    maxWidth: 400.0, minHeight: 50.0),
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
                      ],
                    ),
                  ))),
    );
  }
}
