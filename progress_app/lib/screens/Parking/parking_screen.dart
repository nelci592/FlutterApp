import 'dart:core';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './first_floor_stuff.dart';
import '../widgets/drawer.dart';
import '../Parking/floors/first_floor.dart';
import '../Parking/floors/second_floor.dart';
import '../Parking/floors/third_floor.dart';
// import 'package:progress_app/models/parking_floor_state.dart';
// import 'package:progress_app/models/parking_space.dart';
// import 'package:progress_app/screens/Parking/parking_floor.dart';

class ParkingView extends StatefulWidget {
  @override
  _ParkingViewState createState() => _ParkingViewState();
}

class _ParkingViewState extends State<ParkingView> {
  int numberFirstFloor = 0;
  int numberSecondFloor = 0;
  int numberThirdFloor = 0;
  Timestamp todayTimeStamp = Timestamp.fromDate(DateTime.now());
  String num;

  @override
  void initState() {
    super.initState();
    _deleteExpiredAbsences();
  }

  _deleteExpiredAbsences() async {
    Firestore.instance
        .collection("absences")
        .where("endDate", isLessThan: todayTimeStamp)
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        Firestore.instance
            .collection("absences")
            .document(result.documentID)
            .delete()
            .then((_) {});
      });
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(26, 10, 26, 0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: Row(
                    children: <Widget>[
                      Text("Parking",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(50, 50, 50, 1)))
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Container(
                      width: 400,
                      height: 65,
                      child: FirstFloorInfo(),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Container(
                      width: 400,
                      height: 65,
                      child: SecondFloorInfo(),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: Container(
                      width: 400, height: 65, child: ThirdFloorInfo()),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Container(
                      color:Colors.yellow,
                      child: FirstFloor())),
              ],
            ),
          ),
        ));
  }
}

// import 'dart:core';
// import 'package:flutter/material.dart';
// import 'package:progress_app/models/parking_floor_state.dart';
// import 'package:progress_app/models/parking_space.dart';
// import 'package:progress_app/screens/Parking/parking_floor.dart';

// // import 'package:progress_app/models/UserData/user_global_data.dart';
// // import 'package:progress_app/screens/Parking/available_spots.dart';
// // import 'package:progress_app/screens/Parking/share_space_view.dart';
// // import 'package:progress_app/screens/Parking/shared_spaces.dart';
// // import 'package:progress_app/screens/Parking/space_owner_view.dart';
// // import 'package:provider/provider.dart';
// import './first_floor_stuff.dart';
// import '../widgets/drawer.dart';

// class ParkingView extends StatelessWidget {
//   final List<ParkingSpace> sharedSpaces;

//   const ParkingView({Key key, this.sharedSpaces}) : super(key: key);

//   // Widget buildViewByUserType(GlobalUserData userData) {
//   //   if (GlobalUserData.isParkingSpaceOwner) {
//   //     if (GlobalUserData.isSpaceShared) {
//   //       return Align(
//   //           alignment: Alignment.bottomCenter, child: ShareSpaceView(model: userData));
//   //     } else {
//   //       return Align(
//   //           alignment: Alignment.bottomCenter,
//   //           child: NotifySpaceAvailableView(model: userData));
//   //     }
//   //   } else {
//   //     return SharedSpacesView(sharedSpaces: sharedSpaces);
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        appBar: AppBar(
//               elevation: 0.0,
//               backgroundColor: Colors.white,
//               leading: Builder(
//                 builder: (BuildContext context) {
//                   return IconButton(
//                     icon: const Icon(Icons.menu),
//                     color: Colors.black,
//                     onPressed: () {
//                       Scaffold.of(context).openDrawer();
//                     },
//                     tooltip:
//                         MaterialLocalizations.of(context).openAppDrawerTooltip,
//                   );
//                 },
//               ),
//               actions: <Widget>[
//                 IconButton(
//                   icon: Icon(Icons.notifications_none),
//                   onPressed: () {},
//                   color: Colors.black,
//                 )
//               ],
//             ),
//         drawer: AppDrawer(),
//         body: Container(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(26, 10, 26, 0),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
//                   child: Row(
//                     children: <Widget>[
//                       Text("Parking",
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                               fontSize: 30,
//                               color: Color.fromRGBO(50, 50, 50, 1)))
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
//                   child: ParkingFloor(
//                       status: ParkingFloorState.available, floorName: "P1", numberAvailble: 9,) ,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
//                   child: ParkingFloor(
//                       status: ParkingFloorState.almostFull, floorName: "P2", numberAvailble: 5,),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
//                   child: ParkingFloor(
//                       status: ParkingFloorState.full, floorName: "P3", numberAvailble: 12,),
//                 ),
//                 Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//                     child: FirstFloor()),
//                 // ChangeNotifierProvider<GlobalUserData>(
//                 //     create: (context) => GlobalUserData(),
//                 //     child: Expanded(
//                 //       child: Consumer<GlobalUserData>(
//                 //           builder: (context, myModel, child) {
//                 //             return  MediaQuery.removePadding(
//                 //             context: context,
//                 //             removeTop: true,
//                 //             child: FirstFloor());
//                 //       }),
//                 //     )),
//               ],
//             ),
//           ),
//         ));
//   }
// }
