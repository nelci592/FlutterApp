import 'package:flutter/material.dart';
import 'package:progress_app/models/parking_space.dart';
import 'package:progress_app/models/shared_space_state.dart';

class SharedSpaceItem extends StatefulWidget {
  final ParkingSpace space;
  SharedSpaceItem({Key key, this.space}) : super(key: key);

  @override
  _SharedSpaceItemState createState() => _SharedSpaceItemState();
}

class _SharedSpaceItemState extends State<SharedSpaceItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 0, 26, 0),
      child: Container(
        height: 46,
         child: Row(children: <Widget>[
             Center(
               child:
             Text(
               this.widget.space.number.toString(),
               style: TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.bold))),
           Expanded(
             child:Padding(
               padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
               child: Container(
                 child:Align(
               alignment: Alignment.centerLeft,
               child: Text(this.widget.space.owner,
               style: TextStyle(fontSize:14))
               )),
             )),
             
            Expanded(
              child: Container(
                child:Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Text(this.widget.space.state == SharedSpaceState.available ? "available" : "occupied",
                              style:TextStyle(fontSize: 14, color: this.widget.space.state == SharedSpaceState.available ? Colors.green : Colors.grey)),
                  ),)
              ),
            )
         ],),
      ),
    );
  }
}