import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:my_worker/models/Customer.dart';
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
    Map<String, dynamic> json = jsonDecode(r.data);
    return User.fromJson(json["map"]["user"]);
  }

  Future<List<Customer>> searchCustomerByPlatformId(int crmId, int platformType, String platformId) async {
    Response r = await dio.post(
      "/customer/searchCustomerByPlatformId",
      data: {
        "crmId": crmId,
        "platformType": platformType,
        "platformId": platformId
      },
      options: _options
    );
    Map<String, dynamic> json = jsonDecode(r.data);
    return json["map"]["result"].map<Customer>((e) => Customer.fromJson(e)).toList();
  }
  Future<Customer> getCustomerDetail(int customerId) async {
    Response r = await dio.post(
      "/customer/getCustomerDetail",
      data: {
        "customerId": customerId
      },
      options: _options
    );
    Map<String, dynamic> json = jsonDecode(r.data);
    return Customer.fromJson(json["map"]["result"]);
  }
}