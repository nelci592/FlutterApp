import 'package:flutter/foundation.dart';

class Absence {
  final DateTime startDate;
  final DateTime endDate;
  final int spotNumber;

  Absence({
    @required this.startDate,
    @required this.endDate,
    @required this.spotNumber,
  });
}
