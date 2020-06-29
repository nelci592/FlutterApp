import 'package:progress_app/models/shared_space_state.dart';

class ParkingSpace {
    String owner;
    int number;
    SharedSpaceState state;

    ParkingSpace({this.owner, this.state, this.number});
}