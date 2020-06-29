import 'package:flutter/material.dart';
import 'package:progress_app/models/parking_space.dart';
import 'package:progress_app/screens/Parking/shared_space_item.dart';

class SharedSpacesView extends StatefulWidget {
  final List<ParkingSpace> sharedSpaces;
  SharedSpacesView({Key key, this.sharedSpaces}) : super(key: key);

  @override
  _SharedSpacesViewState createState() => _SharedSpacesViewState();
}

class _SharedSpacesViewState extends State<SharedSpacesView> {
  Widget _buildRow({ParkingSpace parkingSpace}) {
    return SharedSpaceItem(space: parkingSpace);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 5),
          child: Row(
            children: <Widget>[
              Text("P1 Available Spots",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Segoe',
                      color: Color.fromRGBO(50, 50, 50, 1)))
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                    color: Colors.grey,
                  ),
              itemCount: widget.sharedSpaces.length,
              itemBuilder: (context, index) {
                return _buildRow(parkingSpace: widget.sharedSpaces[index]);
              }),
        ),
      ],
    );
  }
}
