// user info provider

import 'package:flutter/material.dart';

class UserInfoModel with ChangeNotifier {
  final Map<String, String> profile = {
    'username': 'XiaoT',
    'email': '270199332 at qq.com',
    'avatar': 'https://picsum.photos/id/137/600/400',
  };
  void update(String name, String newValue) {
    profile[name] = newValue;
    notifyListeners();
  }
}
