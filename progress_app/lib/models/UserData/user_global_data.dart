import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class GlobalUserData extends ChangeNotifier {
 
  static bool isParkingSpaceOwner = true;
  static bool isSpaceShared = false;

  void onDataChanged() {
    this.notifyListeners();
  }
}
