import 'package:flutter/material.dart';
import 'package:medica/models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  User? get user => _user;
}
