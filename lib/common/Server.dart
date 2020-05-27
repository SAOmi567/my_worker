import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:my_worker/models/User.dart';

class Server {
  BuildContext context;
  Options _options;
  static Dio dio  = new Dio(
    BaseOptions(
      baseUrl: "http://www.micang8.com:8080/mc8_server archive"
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
  Future<User> login(String account, String pwd) async {
    Response r = await dio.get(
      "",
      queryParameters: {
        "account": account,
        "password": pwd
      },
      options: _options
    );
    print(r.data);
    return User.fromJson(r.data);
  }
}