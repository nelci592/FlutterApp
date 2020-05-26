import '../parking_space.dart';
import '../shared_space_state.dart';

class ParkingGlobalData {
  static List<ParkingSpace> spaces = List<ParkingSpace>();

  static List<ParkingSpace> getSharedSpaces() {
    //Get the shared spaces and their status from the server.

    //Mock data
    spaces.add(new ParkingSpace(
        state: SharedSpaceState.available, number: 42, owner: "John Doe"));
    spaces.add(new ParkingSpace(
        state: SharedSpaceState.available, number: 12, owner: "John Doe1"));
    spaces.add(new ParkingSpace(
        state: SharedSpaceState.occupied, number: 23, owner: "John Doe2"));
    spaces.add(new ParkingSpace(
        state: SharedSpaceState.occupied, number: 24, owner: "John Doe3"));
    spaces.add(new ParkingSpace(
        state: SharedSpaceState.available, number: 24, owner: "John Doe4"));
    spaces.add(new ParkingSpace(
        state: SharedSpaceState.occupied, number: 24, owner: "John Doe5"));
    spaces.add(new ParkingSpace(
        state: SharedSpaceState.occupied, number: 24, owner: "John Doe6"));
    return spaces;
    //Mock data
  }
}
