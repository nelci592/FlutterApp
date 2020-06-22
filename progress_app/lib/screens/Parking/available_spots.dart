import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AvailableSpots extends StatefulWidget {
  @override
  _AvailableSpotsState createState() => _AvailableSpotsState();
}

class _AvailableSpotsState extends State<AvailableSpots> {
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
             (ctx, streamSnapshot) { 
               final documents = streamSnapshot.data.documents;
              //   (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              // final documents = snapshot.data.documents;
              return ListView.builder(
                  itemExtent: 60,
                  itemCount: documents.length,
                  itemBuilder: (ctx, index) {
                    DateTime now = new DateTime.now();
                    DateTime today = new DateTime(now.year, now.month, now.day);
                    DateTime startDate = documents[index]['startDate'].toDate();
                    DateTime endDate = documents[index]['endDate'].toDate();

                    int difference = today.difference(startDate).inDays.abs();
                    int difference1 = endDate.difference(today).inDays.abs();

                    if (difference >= 0 && difference1 >= 0)
                      return Card(
                        child: ListTile(
                          leading: Text(
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
