import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LessonsList extends StatefulWidget {
  @override
  _LessonsListState createState() => _LessonsListState();
}

class _LessonsListState extends State<LessonsList> {
  var nextMonday;

  void main() {
    var dayOfWeek = 1;
    DateTime date = DateTime.now();

    nextMonday =
        date.subtract(Duration(days: (date.weekday - 7) - dayOfWeek)).toLocal();
  }

  @override
  void initState() {
    super.initState();
    main();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection('dancing lessons').where("dateOfLesson", isLessThanOrEqualTo: nextMonday).snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data.documents;
          return ListView.builder(
              itemExtent: 60,
              itemCount: documents.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: ListTile(
                    leading: Text(
                      documents[index]['email'],
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
