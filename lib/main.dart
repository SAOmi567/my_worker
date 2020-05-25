import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_worker/pages/CustomerDetailPage.dart';
import 'package:my_worker/pages/LoginPage.dart';
import 'package:my_worker/pages/MainPage.dart';
import 'package:provider/provider.dart';

import 'models/login_user_model.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginUserModel()
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: <String, WidgetBuilder> {
        "routes/main":(_) => new MainPage(),
        "routes/customerDetail": (_) => new CustomerDetailPage()
      },
    );
  }
}
