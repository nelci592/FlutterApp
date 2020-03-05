import 'dart:math';

import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            //  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                  constraints: BoxConstraints(maxWidth: 400.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Notify absence",
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
          Text(
              "Start Date: ${DateFormat('MM/dd/yyyy').format(_startDate).toString()}"),
          Text(
              "End Date: ${DateFormat('MM/dd/yyyy').format(_endDate).toString()}"),
          Container(
            height: 50.0,
            child: RaisedButton(
              onPressed: () {
                notify(_startDate.toString(), _endDate.toString(), 2);
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
                  constraints: BoxConstraints(maxWidth: 400.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Continue",
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
      )),
      floatingActionButton: new Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.amber,
        ),
        child: new Builder(
          builder: (context) => new FloatingActionButton(
              child: new Icon(Icons.date_range),
              onPressed: () async {
                await displayDateRangePicker(context);
              }),
        ),
      ),
    );
  }
}
