import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_worker/models/CustomerTag.dart';

class CustomerManualTagPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomerManualTagPageState();
  }

}

class _CustomerManualTagPageState extends State<CustomerManualTagPage>  {
  List<DataRow> _result = <DataRow>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.black54,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  child: Text("新建标签 "),
                  onPressed: () {}
                )
              ],
            ),
          ),
          Container(
            child: DataTable(
              dataRowHeight: 65,
              columns: [
                DataColumn(
                    label: Container(
                      width: 200,
                      child: Text("标签名称"),
                    )
                ),
                DataColumn(
                    label: Container(
                      width: 200,
                      child: Text("备注"),
                    )
                ),
                DataColumn(
                    label: Container(
                      width: 200,
                      child: Text("更新时间"),
                    )
                ),
                DataColumn(
                    label: Container(
                      width: 100,
                      child: Text("会员人数"),
                    )
                ),
                DataColumn(
                    label: Text("操作")
                )
              ],
              rows: _result,
            ),
          )
        ],
      ),
    );
  }
  List<DataRow> genDataRowFromCustomer(List<CustomerTag> customerTags) {
    List<DataRow> ret = [];
    customerTags.forEach((e) {
      DataRow dr = DataRow(
          cells: [
            DataCell(Text(e.name)),
            DataCell(Text(e.mark)),
            DataCell(Text(e.lastUpdateTime)),
            DataCell(Text(e.count.toString() + " 人")),
            DataCell(PopupMenuButton<String>(
              onSelected: (String val) {
                //Navigator.of(context).pushNamed("routes/customerDetail", arguments: e.id);
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