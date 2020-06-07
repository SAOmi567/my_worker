import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CustomerSearchBar extends StatefulWidget {
  final Function onSearch1Func;

  CustomerSearchBar({this.onSearch1Func});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomerSearchBarState();
  }

}

class _CustomerSearchBarState extends State<CustomerSearchBar> {
  int _mode = 0;
  //
  int _platformType = 0;
  String _platformId = "";
  //
  String _level = "全部";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          // 顶条
          Container(
            color: Colors.black12,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Offstage(
                  offstage: _mode != 0,
                  child: Row(
                    children: <Widget>[
                      DropdownButton(
                        value: _platformType,
                        items: [
                          DropdownMenuItem(child: Text("所有平台"), value: 0),
                          DropdownMenuItem(child: Text("淘宝"), value: 1),
                          DropdownMenuItem(child: Text("拼多多"), value: 2)
                        ],
                        onChanged: (val) {
                          setState(() {
                            _platformType = val;
                          });
                        },
                      ),
                      Container(
                        width: 200,
                        child: TextField(
                          autofocus: true,
                          onChanged: (val) {
                            _platformId = val;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                              ),
                              hintText: "平台账号ID",
                              isDense: true,
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              fillColor: Colors.white
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    DropdownButton(
                      value: _mode,
                      items: [
                        DropdownMenuItem(child: Text("线上模式"), value: 0),
                        DropdownMenuItem(child: Text("线下模式"), value: 1)
                      ],
                      onChanged: (val) {
                        setState(() {
                          _mode = val;
                        });
                      },
                    ),
                    FlatButton(
                      onPressed: () {
                      },
                      child: Text("重置"),
                    ),
                    RaisedButton(
                      onPressed: _onSearch,
                      child: Text("查询", style: TextStyle(color: Colors.white),),
                      color: Colors.pinkAccent,
                    ),
                  ],
                )
              ],
            ),
          ),
          // 超级查询
          Offstage(
            offstage: _mode != 1,
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

  void _onSearch() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_mode == 0) {
      widget.onSearch1Func({
        "platformType": _platformType,
        "platformId": _platformId
      });
    }
  }
}