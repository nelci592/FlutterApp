import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/drawer.dart';
import '../confirmation/success_dancing.dart';
import 'lessons_list.dart';

class BookLesson extends StatefulWidget {
  @override
  _BookLessonState createState() => _BookLessonState();
}

class _BookLessonState extends State<BookLesson> {
  var nextMonday;
  String nextWednesday;
  String dateOfNextClass;
  bool isJoining = false;
  bool isFull = false;
  int numberOfPeople = 0;

  void main() {
    var dayOfWeek = 1;
    DateTime date = DateTime.now();
    nextMonday =
        date.subtract(Duration(days: (date.weekday - 7) - dayOfWeek)).toLocal();
  }

  _getNumberOfPresence() async {
    Firestore.instance
        .collection('/dancing lessons')
        //  .where("dateOfLesson", isLessThanOrEqualTo: nextMonday)
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        numberOfPeople++;
      });
    });
  }

  _getCurrentUser() async {
    final user = await FirebaseAuth.instance.currentUser();

    var result = await Firestore.instance
        .collection('/dancing lessons')
        .where("dateOfLesson", isLessThanOrEqualTo: nextMonday)
        .getDocuments();

    setState(() {
      result.documents.forEach((res) {
        (user.email.toString() == res.data['email'])
            ? isJoining = true
            : isJoining = false;
      });
      return isJoining;
    });

    print(numberOfPeople);

    setState(() {
      (numberOfPeople < 5) ? isFull = false : isFull = true;
      return isFull;
    });
  }

  @override
  void initState() {
    super.initState();
    main();
    _getNumberOfPresence();
    _getCurrentUser();
  }

  void _join() async {
    final user = await FirebaseAuth.instance.currentUser();
    final email = user.email.toString();

    Firestore.instance.collection('dancing lessons').add({
      'dateOfLesson': nextMonday,
      'email': email,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.black,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
            color: Colors.black,
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Container(
        //color: Colors.yellow,
        padding: EdgeInsets.only(left: 30),
        child: Column(
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              child: SvgPicture.asset(
                'assets/images/dancing.svg',
                color: Colors.grey,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text("Presence list", style: TextStyle(fontSize: 20))),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: 350,
                height: 220,
                child: LessonsList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                  "The next lesson is on " +
                      " ${DateFormat('dd/MM/yyyy').format(nextMonday).toString()}",
                  style: TextStyle(fontSize: 18)),
            ),
            !isFull
                ? (!isJoining
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          height: 40.0,
                          width: 350,
                          child: RaisedButton(
                            onPressed: () {
                              _join();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SuccessDancing()),
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
                                    maxWidth: 400.0, minHeight: 40.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Join the class",
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
                      )
                    : Text("You are joining the class"))
                : Text("The list is full"),
          ],
        ),
      ),
    );
  }
}
