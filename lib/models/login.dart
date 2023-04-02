// login provider

import 'package:flutter/material.dart';

class LoginModel with ChangeNotifier {
  bool isSignedIn = false;
  void update(bool newStatus) {
    isSignedIn = newStatus;
    notifyListeners();
  }
}
