import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookFacility extends StatefulWidget {
  @override
  _BookFacilityState createState() => _BookFacilityState();
}

class _BookFacilityState extends State<BookFacility> {
  int numberFirstFloor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection('absences')
                .where("state", isEqualTo: "available")
              .orderBy("spotNumber")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
             final documents = snapshot.data.documents;

              return ListView.builder(
                  itemExtent: 60,
                  itemCount: documents.length,
                  itemBuilder: (ctx, index) {
                    DateTime now = new DateTime.now();
                    DateTime today = new DateTime(now.year, now.month, now.day);
                    DateTime startDate = documents[index]['startDate'].toDate();
                    DateTime endDate = documents[index]['endDate'].toDate();
                   

                    int difference = today.difference(startDate).inDays;
                    int difference1 = endDate.difference(today).inDays;

                    if (difference >= 0 && difference1 >= 0)
                      return Card(
                        child: ListTile(
                          leading:
                              Text(
                            (documents[index]['spotNumber']).toString() +
                                "        " +
                                documents[index]['nameOfOwner'],
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      );
                    return null;
                  });
            }));
  }
}
