import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_worker/common/Server.dart';
import 'package:my_worker/coms/CustomerDetailBase.dart';
import 'package:my_worker/models/Customer.dart';
import 'file:///E:/project/flutter/my_worker/lib/states/UserState.dart';
import 'package:provider/provider.dart';

class CustomerDetailPage extends StatefulWidget {
  int customerId;
  CustomerDetailPage(this.customerId);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomerDetailPageState();
  }

}

class _CustomerDetailPageState extends State<CustomerDetailPage> {
  final List<String> _tabTitles = [
    "基础信息",
    "会员偏好"
  ];
  TabController _tabController;
  Customer _customer;


  @override
  void initState() {
    _tabController = TabController(
      length: _tabTitles.length,
      vsync: ScrollableState()
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<Customer>(
      future: Server().getCustomerDetail(widget.customerId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(snapshot.error);
          }
          else {
            _customer = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                leading: BackButton(),
                title: Text(_customer.name),
                backgroundColor: Colors.black,
                bottom: TabBar(
                  tabs: _tabTitles.map((e) => Text(e, style: TextStyle(fontSize: 16))).toList(),
                  controller: _tabController,
                  indicatorColor: Colors.pinkAccent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.pinkAccent,
                  unselectedLabelColor: Colors.white,
                  indicatorWeight: 5.0,
                  labelStyle: TextStyle(height: 2)
                ),
              ),
              body: TabBarView(
                controller: _tabController,
                children: _tabTitles.map((f) {
                  if (f == "基础信息") {
                    return CustomerDetailBase(_customer);
                  }
                  else {
                    return Center(
                      child: Text(f),
                    );
                  }
                }).toList(),
              ),
            );
          }
        }
        else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

}