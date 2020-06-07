import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_worker/models/User.dart';
import 'package:my_worker/pages/CustomerPage.dart';
import 'package:my_worker/pages/HomePage.dart';
import 'package:my_worker/states/UserState.dart';
import 'package:provider/provider.dart';

import 'CustomerManualTagPage.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainPageState();
  }

}

class _MainPageState extends State<MainPage> {
  int _curPage = 0;
  List<Widget> _pageList = [
    HomePage(),
    CustomerPage(),
    CustomerManualTagPage()
  ];
  String _pageTitle = "首页";
  bool _isShowAppBar = true;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserState>(context).getUser();
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: _isShowAppBar? AppBar(
          backgroundColor: Colors.black,
          title: Text(_pageTitle),
        ): null,
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onLongPress: () {
            //showSuperMenu();
          },
          child: _pageList.elementAt(_curPage),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.black
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          "https://mc8.oss-cn-shenzhen.aliyuncs.com/img/avatar/" + user.avatar
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("   " + user.name, style: TextStyle(color: Colors.white),)
                      ],
                    )
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("首页"),
                onTap: () {
                  setState(() {
                    _curPage = 0;
                    _pageTitle = "首页";
                    Navigator.pop(context);
                  });
                },
              ),
              ExpansionTile(
                title: Text("会员中心"),
                leading: Icon(Icons.contacts),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.search),
                    title: Text("快速查询"),
                    onTap: () {
                      setState(() {
                        _curPage = 1;
                        _pageTitle = "会员中心 > 快速查询";
                        Navigator.pop(context);
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("新建会员"),
                    onTap: () {
                      setState(() {
                        _curPage = 1;
                        _pageTitle = "会员中心 > 新建会员";
                        Navigator.pop(context);
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.label),
                    title: Text("手动标签"),
                    onTap: () {
                      setState(() {
                        _curPage = 2;
                        _pageTitle = "会员中心 > 手动标签";
                        Navigator.pop(context);
                      });
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("线上业务"),
                leading: Icon(Icons.wb_cloudy),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.search),
                    title: Text("快速查询"),
                    onTap: () {
                      setState(() {
                        _curPage = 1;
                        _pageTitle = "线上业务 > 快速查询";
                        Navigator.pop(context);
                      });
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSuperMenu() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return new Container(
          height: 100.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Card(
                child: Row(
                  children: <Widget>[
                    Text("打开顶栏"),
                    Switch(
                      value: _isShowAppBar,
                      onChanged: (bool val) {
                        setState(() {
                          _isShowAppBar = val;
                        });
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}