import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_worker/models/login_user_model.dart';
import 'package:provider/provider.dart';

class CustomerDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomerDetailPageState();
  }

}

class _CustomerDetailPageState extends State<CustomerDetailPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: Consumer<LoginUserModel>(
        builder: (context, loginUser, child) {
          return Text("是否登录：${loginUser.isLogin}");
        }
      ),
    );
  }

}