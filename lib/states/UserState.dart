import 'package:flutter/cupertino.dart';
import 'package:my_worker/models/User.dart';

class UserState extends ChangeNotifier {
  User _user;

  bool isLogin() {
    return _user != null;
  }

  User getUser() {
    return _user;
  }

  setUser(User user) {
    _user = user;
    super.notifyListeners();
  }
}