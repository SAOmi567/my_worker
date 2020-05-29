import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_worker/pages/CustomerDetailPage.dart';
import 'package:my_worker/pages/LoginPage.dart';
import 'package:my_worker/pages/MainPage.dart';
import 'package:provider/provider.dart';

import 'states/UserState.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserState()
        )
      ],
      child: MyApp(),
    )
  );
  SystemChrome.setEnabledSystemUIOverlays([]); // 隐藏系统状态栏（全屏）
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
        routes: <String, WidgetBuilder> {
          "routes/main":(_) => new MainPage(),
          "routes/customerDetail": (_) => new CustomerDetailPage()
        },
      ),
    );
  }
}
