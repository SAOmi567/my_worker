import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:my_worker/models/User.dart';

class Server {
  BuildContext context;
  Options _options;
  static Dio dio  = new Dio(
    BaseOptions(
      baseUrl: "http://192.168.1.102:8080"
      //baseUrl: "http://www.micang8.com:8080/mc8_server archive"
    )
  );

  Server([this.context]) {
    _options = Options(
      extra: {
        "context": context
      }
    );
  }

  // 登入
  Future<User> login(String userName, String pwd) async {
    Response r = await dio.post(
      "/system/login2",
      data: {
        "username": userName,
        "password": pwd
      },
      options: _options
    );
    print(r.data is String);
    //return User.fromJson(r.data);
  }
}