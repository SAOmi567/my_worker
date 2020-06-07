import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:my_worker/models/Customer.dart';

class CustomerDetailBase extends StatefulWidget {
  Customer customer;

  CustomerDetailBase(this.customer);

  @override
  State<StatefulWidget> createState() {
    return _CustomerDetailBaseState();
  }

}

class _CustomerDetailBaseState extends State<CustomerDetailBase> {
  TextStyle _titleTextStyle;
  TextStyle _contentTextStyle;


  @override
  void initState() {
    _titleTextStyle = new TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold
    );
    _contentTextStyle = new TextStyle(
        fontSize: 26
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 300,
            color: Colors.black87,
            child: Column(
              children: <Widget>[
                Container(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591278430478&di=4e695ba18c025b9d60cba6276f112a24&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201204%2F07%2F111527vyw2knbkxsk9l2td.jpg"
                    ),
                  ),
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                ),
                Text(
                  "会员编号：" + widget.customer.id.toString(),
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Card(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  child: Chip(
                                    label: Text("维度标签",style: TextStyle(color: Colors.white),),
                                    backgroundColor: Colors.pinkAccent,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  ),
                                  margin: EdgeInsets.only(right: 10),
                                )
                              ],
                            ),
                            Wrap(
                              children: <Widget>[
                                Chip(label: Text("收高货")),
                                Chip(label: Text("老客户")),
                                Chip(label: Text("手镯收藏家")),
                                Chip(label: Text("超级好说话")),
                                Chip(label: Text("收高货")),
                                Chip(label: Text("老客户")),
                                Chip(label: Text("手镯收藏家")),
                                Chip(label: Text("超级好说话")),
                                Chip(label: Text("收高货")),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  child: Chip(
                                    label: Text("会员信息",style: TextStyle(color: Colors.white),),
                                    backgroundColor: Colors.pinkAccent,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  ),
                                  margin: EdgeInsets.only(right: 10),
                                )
                              ],
                            ),
                            Table(
                              columnWidths: <int,TableColumnWidth>{
                                0:FixedColumnWidth(120),
                                1:FixedColumnWidth(200),
                                2:FixedColumnWidth(150),
                                3:FixedColumnWidth(200)
                              },
                              children: [
                                TableRow(
                                    children: [
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                          child: Text("会员ID：",
                                              textAlign: TextAlign.right,
                                              style: _titleTextStyle
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Text(
                                            widget.customer.id.toString(),
                                            style: _contentTextStyle
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Text("等级：",
                                            textAlign: TextAlign.right,
                                            style: _titleTextStyle
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Text("111"),
                                      )
                                    ]
                                ),
                                TableRow(
                                    children: [
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                          child: Text("余额：",
                                              textAlign: TextAlign.right,
                                              style: _titleTextStyle
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Text(widget.customer.balance.toString() + " 元"),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Text("累计消费：",
                                            textAlign: TextAlign.right,
                                            style: _titleTextStyle
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Text(widget.customer.totalConsumption.toString() + " 元"),
                                      ),
                                    ]
                                ),
                                TableRow(
                                    children: [
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                          child: Text("积分：",
                                              textAlign: TextAlign.right,
                                              style: _titleTextStyle
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Text(widget.customer.memberPoint.toString() + "分"),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Text("创建时间：",
                                            textAlign: TextAlign.right,
                                            style: _titleTextStyle
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Text(widget.customer.createTime),
                                      )
                                    ]
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  child: Chip(
                                    label: Text("绑定账号",style: TextStyle(color: Colors.white),),
                                    backgroundColor: Colors.pinkAccent,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  ),
                                  margin: EdgeInsets.only(right: 10),
                                )
                              ],
                            ),
                            Wrap(
                                children: <Widget>[
                                  Chip(
                                    label: Text("No." + widget.customer.cardNumber),
                                    avatar: Icon(Icons.credit_card),
                                    backgroundColor: Colors.lightGreen,
                                  ),
                                  Chip(
                                      label: Text(widget.customer.taobaoId),
                                      avatar: Image.asset("assets/img/淘宝.png"),
                                      backgroundColor: Colors.lime
                                  ),
                                ]
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    child: Chip(
                                      label: Text("客户画像",style: TextStyle(color: Colors.white),),
                                      backgroundColor: Colors.pinkAccent,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    ),
                                    margin: EdgeInsets.only(right: 10),
                                  )
                                ],
                              ),
                            ),
                            Table(
                              columnWidths: <int,TableColumnWidth>{
                                0:FixedColumnWidth(120),
                                1:FixedColumnWidth(200),
                                2:FixedColumnWidth(150),
                                3:FixedColumnWidth(200)
                              },
                              children: [
                                TableRow(
                                    children: [
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                          child: Text("姓名：",
                                              textAlign: TextAlign.right,
                                              style: _titleTextStyle
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Text(
                                            widget.customer.name,
                                            style: _contentTextStyle
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Text("性别：",
                                            textAlign: TextAlign.right,
                                            style: _titleTextStyle
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Text(widget.customer.sex?"男":"女"),
                                      )
                                    ]
                                ),
                                TableRow(
                                    children: [
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                          child: Text("生日：",
                                              textAlign: TextAlign.right,
                                              style: _titleTextStyle
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Text(widget.customer.birthDate),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Text("手机号 ：",
                                            textAlign: TextAlign.right,
                                            style: _titleTextStyle
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Text(widget.customer.mobileNumber),
                                      ),
                                    ]
                                )
                              ],
                            )
                          ],
                        ),
                      ),
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