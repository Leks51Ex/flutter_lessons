import 'package:flutter/material.dart';

class ChangeExample with ChangeNotifier {
  String status = 'Loading';

  void setStatus(String newStatus) {
    status = newStatus;
    notifyListeners();
  }
}
