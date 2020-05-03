import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    onPressed: (){
                      Navigator.of(context).pushNamedAndRemoveUntil("routes/main", ModalRoute.withName("/"));
                    },
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

}