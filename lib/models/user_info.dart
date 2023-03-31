// user info provider

import 'package:flutter/material.dart';

class UserInfoModel with ChangeNotifier {
  String username = 'XiaoT';

  String email = '270199332 at qq.com';

  void update(String name, String newValue) {
    switch (name) {
      case 'email':
        email = newValue;
        break;
      case 'username':
        username = newValue;
        break;
    }
    notifyListeners();
  }
}
