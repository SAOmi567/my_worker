import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_worker/coms/searchBar/CustomerSearchBar.dart';
import 'package:my_worker/models/Customer.dart';

class CustomerPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomerPageState();
  }

}

class _CustomerPageState extends State<CustomerPage> {
  List<DataRow> _result = <DataRow>[];

  @override
  Widget build(BuildContext context) {
    _result.add(DataRow(
      cells: [
        DataCell(Text("周杰伦")),
        DataCell(
            Row(
              children: <Widget>[
                Icon(Icons.credit_card),
                Text("HYK1232355534")
              ],
            )
        ),
        DataCell(Text("SSS")),
        DataCell(Text("100.0")),
        DataCell(Text("1000")),
        DataCell(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.adb),
                    onPressed: (){},
                  )
                ],
              )
            ],
          )
        ),
        DataCell(Text("2020-03-11 12:23:40")),
        DataCell(PopupMenuButton<String>(
          onSelected: (String val) {
            Navigator.of(context).pushNamed("routes/customerDetail");
          },
          itemBuilder: (context) {
            return <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: "detail",
                child: Text("详情"),
              )
            ];
          },
        )),
      ]
    ));
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          CustomerSearchBar(),
          Container(
            child: DataTable(
              dataRowHeight: 65,
              columns: [
                DataColumn(
                    label: Text("姓名")
                ),
                DataColumn(
                    label: Text("卡号")
                ),
                DataColumn(
                    label: Text("等级")
                ),
                DataColumn(
                    label: Text("余额")
                ),
                DataColumn(
                    label: Text("积分")
                ),
                DataColumn(
                    label: Text("关联平台账号")
                ),
                DataColumn(
                    label: Text("创建时间")
                ),
                DataColumn(
                    label: Text("操作")
                )
              ],
              rows: _result,
            ),
          )
        ],
      )
    );
  }

  List<DataRow> genDataRowFromCustomer(List<Customer> customers) {
    List<DataRow> ret = [];
    customers.forEach((element) {
      DataRow dr = DataRow(
          cells: [
            DataCell(Text("周杰伦")),
            DataCell(
                Row(
                  children: <Widget>[
                    Icon(Icons.credit_card),
                    Text("HYK1232355534")
                  ],
                )
            ),
            DataCell(Text("SSS")),
            DataCell(Text("100.0")),
            DataCell(Text("1000")),
            DataCell(
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.adb),
                          onPressed: (){},
                        )
                      ],
                    )
                  ],
                )
            ),
            DataCell(Text("2020-03-11 12:23:40")),
            DataCell(PopupMenuButton<String>(
              onSelected: (String val) {
                Navigator.of(context).pushNamed("routes/customerDetail");
              },
              itemBuilder: (context) {
                return <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: "detail",
                    child: Text("详情"),
                  )
                ];
              },
            )),
          ]
      );
      ret.add(dr);
    });
    return ret;
  }
}