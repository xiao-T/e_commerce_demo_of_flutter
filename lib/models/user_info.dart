// user info provider

import 'package:flutter/material.dart';

class UserInfoModel with ChangeNotifier {
  final Map<String, String> profile = {
    'username': 'XiaoT',
    'email': '270199332 at qq.com',
  };
  void update(String name, String newValue) {
    profile[name] = newValue;
    notifyListeners();
  }
}
