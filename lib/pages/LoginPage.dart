import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_worker/common/Server.dart';
import 'package:my_worker/models/User.dart';
import 'package:my_worker/states/UserState.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }

}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage("https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3609617849,3076246071&fm=26&gp=0.jpg")
          )
        ),
        child: Center(
            heightFactor: 2,
            child: SizedBox(
              width: 300,
              height: 320,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: '账号',
                      ),
                    ),
                  ),
                  SizedBox(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: '密码',
                      ),
                    ),
                  ),
                  RaisedButton(
                    child: Text("登录"),
                    color: Colors.orange,
                    onPressed: _onLogin,
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

  void _onLogin() async {
    EasyLoading.instance.maskType = EasyLoadingMaskType.black;
    EasyLoading.show(status: "登录中...");
    User user;
    try {
      user = await Server(context).login("admin", "wdl131415");
      Provider.of<UserState>(context, listen: false).setUser(user);
    }
    catch(e) {

    }
    finally {
      EasyLoading.dismiss();
    }
    if (user != null) {
      Navigator.of(context).pushNamedAndRemoveUntil("routes/main", ModalRoute.withName("/"));
    }
  }
}