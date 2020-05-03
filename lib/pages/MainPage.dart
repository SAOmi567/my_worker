import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_worker/pages/CustomerPage.dart';
import 'package:my_worker/pages/HomePage.dart';

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
    CustomerPage()
  ];
  String _pageTitle = "首页";
  bool _isShowAppBar = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _isShowAppBar? AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(_pageTitle),
      ) : null,
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
                color: Colors.lightGreen
              ),
              child: Text(
                "侧边栏"
              ),
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("首页"),
              onTap: () {
                setState(() {
                  _curPage = 0;
                  _pageTitle = "首页";
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("客户"),
              onTap: () {
                setState(() {
                  _curPage = 1;
                  _pageTitle = "客户";
                  Navigator.pop(context);
                });
              },
            )
          ],
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