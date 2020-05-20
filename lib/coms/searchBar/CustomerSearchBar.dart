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
                      width: 500,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                          icon: Icon(
                            Icons.search,
                            color: Colors.white
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
                    FlatButton(
                      onPressed: () {
                      },
                      child: Text("重置"),
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
                  columnWidths: <int,TableColumnWidth>{
                    0:FixedColumnWidth(80),
                    1:FixedColumnWidth(200),
                    2:FixedColumnWidth(80),
                    3:FixedColumnWidth(200),
                    4:FixedColumnWidth(80)
                  },
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Text("姓名：",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                              width: 100,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "请输入姓名",
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(10),
                                ),
                              )
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Text("等级：",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
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
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Text("卡号：",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                              width: 100,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "请输入卡号",
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(10),
                                ),
                              )
                          ),
                        ),
                      ]
                    ),
                    TableRow(
                        children: [
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Text("余额：",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.bold)
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    width: 80,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                    )
                                ),
                                Text("—"),
                                Container(
                                    width: 80,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                    )
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Text("积分：",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.bold)
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    width: 80,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                    )
                                ),
                                Text("—"),
                                Container(
                                    width: 80,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                    )
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Text("姓名",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.bold)
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Text("姓名"),
                          ),
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