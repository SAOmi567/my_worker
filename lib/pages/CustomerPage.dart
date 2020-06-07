import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_worker/common/Server.dart';
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
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          CustomerSearchBar(
            onSearch1Func: (searchObj) async {
              EasyLoading.show(status: "查询中...");
              List<Customer> customerList;
              try {
                customerList = await Server(context).searchCustomerByPlatformId(1, searchObj["platformType"], searchObj["platformId"]);
              }
              on DioError catch(e) {
                print(e.message);
              }
              finally {
                EasyLoading.dismiss();
              }
              setState(() {
                _result.clear();
                _result.addAll(genDataRowFromCustomer(customerList));
              });
            }
          ),
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
    customers.forEach((e) {
      DataRow dr = DataRow(
          cells: [
            DataCell(Text(e.name)),
            DataCell(
                Row(
                  children: <Widget>[
                    Icon(Icons.credit_card),
                    Text("NO." + e.cardNumber)
                  ],
                )
            ),
            DataCell(Text("LV." + e.level.toString())),
            DataCell(Text(e.balance.toString())),
            DataCell(Text(e.memberPoint.toString())),
            DataCell(
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Tooltip(
                          message: e.taobaoId,
                          child: Image.asset("assets/img/淘宝.png", width: 20, height: 20,),
                        )
                      ],
                    )
                  ],
                )
            ),
            DataCell(Text(e.createTime)),
            DataCell(PopupMenuButton<String>(
              onSelected: (String val) {
                Navigator.of(context).pushNamed("routes/customerDetail", arguments: e.id);
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