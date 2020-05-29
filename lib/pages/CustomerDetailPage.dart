import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///E:/project/flutter/my_worker/lib/states/UserState.dart';
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
      body: Consumer<UserState>(
        builder: (context, loginUser, child) {
          return Text("是否登录：${loginUser.isLogin}");
        }
      ),
    );
  }

}