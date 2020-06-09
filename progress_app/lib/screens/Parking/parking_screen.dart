import 'dart:core';
import 'package:flutter/material.dart';
import 'package:progress_app/models/parking_floor_state.dart';
import 'package:progress_app/models/parking_space.dart';
import 'package:progress_app/screens/Parking/parking_floor.dart';
import './first_floor_stuff.dart';
import '../widgets/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ParkingView extends StatefulWidget {
  @override
  _ParkingViewState createState() => _ParkingViewState();
}

class _ParkingViewState extends State<ParkingView> {
  int numberFirstFloor=0;
  int numberSecondFloor=0;
  int numberThirdFloor=0;

  String num;

  @override
  void initState() {
    super.initState();
  //  _getNumber1();
  _getNumber2();
 _getNumber3();
  }
  // _getNumber1() async {
  //  Firestore.instance.collection("first floor").where("state", isEqualTo: "available").getDocuments().then((querySnapshot) {
  // querySnapshot.documents.forEach((result) {
  //   numberFirstFloor++;
  //   });
  // });}
final firestoreInstance = Firestore.instance;

    _getNumber2() async {
   firestoreInstance.collection("second floor").where("state", isEqualTo: "available").getDocuments().then((querySnapshot) {
  querySnapshot.documents.forEach((result) {
    numberSecondFloor++;
    });
  });}

    _getNumber3() async {
  firestoreInstance.collection("third floor").where("state", isEqualTo: "available").getDocuments().then((querySnapshot) {
  querySnapshot.documents.forEach((result) {
    numberThirdFloor++;
    });
  });}

  
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
                  child: ParkingFloor(
                    status: ParkingFloorState.full,
                    floorName: "P1",
                    numberAvailble: 0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: ParkingFloor(
                    status: ParkingFloorState.full,
                    floorName: "P2",
                    numberAvailble: numberSecondFloor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: ParkingFloor(
                    status: ParkingFloorState.full,
                    floorName: "P3",
                    numberAvailble: numberThirdFloor,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: FirstFloor()),
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
