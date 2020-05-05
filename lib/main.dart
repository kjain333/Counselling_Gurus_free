import 'package:counselling_gurus/Fragments/ProfilePage.dart';
import 'package:counselling_gurus/Pages/Student/IntroSlider.dart';
import 'package:counselling_gurus/Pages/Student/OTPVerificationPage.dart';
import 'package:counselling_gurus/Pages/Student/SignUpPage.dart';
import 'package:counselling_gurus/Pages/Student/SlideNav.dart';
import 'package:flutter/material.dart';
import 'Pages/Student/LoginPage.dart';
import 'Pages/SplashScreen.dart';
import 'Pages/Student/MainPage.dart';
import 'Fragments/HomePage.dart';
import 'Pages/Student/feedback.dart';

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
      home: MainPage(),
      routes: <String, WidgetBuilder>{
        '/ProfilePage': (BuildContext context) => new ProfilePage(),
        '/LoginPage': (BuildContext context) => new LoginPage(),
        '/MainPage': (BuildContext context) => new MainPage(),
        '/HomePage': (BuildContext context) => new HomePage(),
        '/SlideNav': (BuildContext context) => new SlideNav(),
        '/IntroSlider': (BuildContext context) => new IntroSlider(),
        '/SignUpPage': (BuildContext context) => new SignUpPage(),
        '/FeedbackPage': (BuildContext context) => new FeedbackPage(),
        '/OTPVerificationPage': (BuildContext context) => new OTPVerificationPage(),
      },
    );
  }
}
