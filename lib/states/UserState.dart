import 'package:flutter/cupertino.dart';

class UserState extends ChangeNotifier {
  final bool _isLogin = false;

  bool get isLogin {
    return _isLogin;
  }
}