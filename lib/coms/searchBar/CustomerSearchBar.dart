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
          RaisedButton(
            onPressed: () {
              setState(() {
                _isSuper = !_isSuper;
              });
            },
          ),
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