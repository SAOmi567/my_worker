import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerSearchBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomerSearchBarState();
  }

}

class _CustomerSearchBarState extends State<CustomerSearchBar> {
  bool _isSuper = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          // 顶条
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: Text("手机号", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                          hintText: "请输入手机号",
                          isDense: true,
                          contentPadding: EdgeInsets.all(10)
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("更多"),
                    Switch(
                      value: _isSuper,
                      onChanged: (val)  {
                        setState(() {
                          _isSuper = val;
                        });
                      },
                    ),
                    RaisedButton(
                      onPressed: () {
                      },
                      child: Text("查询"),
                    ),
                  ],
                )
              ],
            ),
          ),
          // 超级查询
          SizedBox(
            height: _isSuper ? 100 : 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Row(
                children: <Widget>[
                  Text("kkk")
                ],
              ),
            ),
          )

        ],
      ),
    );
  }

}