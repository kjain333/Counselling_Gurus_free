import 'package:flutter/material.dart';
import 'Pages/LoginPage.dart';
import 'Pages/SplashScreen.dart';
import 'Pages/MainPage.dart';
import 'Fragments/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/LoginPage': (BuildContext context) => new LoginPage(),
        '/MainPage': (BuildContext context) => new MainPage(),
        '/HomePage': (BuildContext context) => new HomePage(),
      },
    );
  }
}

