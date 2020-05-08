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
  String _level = "全部";

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
                      width: 700,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                          hintText: "请输入手机号",
                          isDense: true,
                          contentPadding: EdgeInsets.all(10),
                          filled: true,
                          fillColor: Colors.white
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
          Offstage(
            offstage: !_isSuper,
            child: SizedBox(
              height: 200,
              child: Card(
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Text("姓名"),
                        ),
                        TableCell(
                          child: Container(
                              width: 100,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "姓名",
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(10),
                                ),
                              )
                          ),
                        ),
                        TableCell(
                          child: Text("等级"),
                        ),
                        TableCell(
                          child: DropdownButton(
                            value: _level,
                            items: [
                              DropdownMenuItem(child: Text("全部"), value: "全部"),
                              DropdownMenuItem(child: Text("SSS"), value: "SSS"),
                              DropdownMenuItem(child: Text("A"), value: "A")
                            ],
                            onChanged: (value) {
                            },
                          ),
                        )
                      ]
                    ),
                    TableRow(
                        children: [
                          TableCell(
                            child: Text("姓名"),
                          ),
                          TableCell(
                            child: Text("姓名"),
                          ),
                          TableCell(
                            child: Text("姓名"),
                          ),
                          TableCell(
                            child: Text("姓名"),
                          )
                        ]
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Text("姓名"),
                        ),
                        TableCell(
                          child: Text("姓名"),
                        ),
                        TableCell(
                          child: Text("姓名"),
                        ),
                        TableCell(
                          child: Text("姓名"),
                        )
                      ]
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}