import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainPageState();
  }

}

class _MainPageState extends State<MainPage> {
  List<Widget> _modulePageList = <Widget>[

  ];
  @override
  Widget build(BuildContext context) {
    // 创建悬浮按钮
    Widget _floatingActionButton = FloatingActionButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        child: Icon(Icons.widgets)
    );
    Scaffold s = null;
    // TODO: implement build
    return Scaffold(
      body: Column(

      ),
      floatingActionButton: _floatingActionButton,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightGreen
              ),
              child: Text(
                "侧边栏"
              ),
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("客户"),
            )
          ],
        ),
      ),
    );
  }

}