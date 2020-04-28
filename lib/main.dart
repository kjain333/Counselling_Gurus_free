import 'package:counselling_gurus/MainPage.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/LoginPage': (BuildContext context) => new LoginPage(),
        '/MainPage': (BuildContext context) => new MainPage()
      },
    );
  }
}

