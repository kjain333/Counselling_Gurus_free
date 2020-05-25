//import 'package:counselling_gurus/Pages/Student/CollegeName.dart';

import 'package:counselling_gurus/Pages/referralpage.dart';

import 'Fragments/Students/ProfilePage.dart';
//import 'file:///C:/Users/Ralex/Desktop/Counselling_Gurus/lib/Fragments/Students/ProfilePage.dart';
import 'package:counselling_gurus/Pages/Student/SlideNav.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/SplashScreen.dart';
import 'Pages/Student/HomePageSources/FAQ.dart';
import 'Pages/Student/StartingPages/IntroSlider.dart';
import 'Pages/Student/StartingPages/LoginPage.dart';
import 'Pages/Student/MainPage.dart';
import 'Fragments/Students/HomePage.dart';
import 'Pages/Student/SideNav/feedback.dart';
import 'Fragments/ChatBoxPage.dart';
import 'Pages/Student/StartingPages/OTPVerificationPage.dart';
import 'Pages/Student/StartingPages/SignUpPage.dart';

var email;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs.getString('email');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counselling Gurus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // email == null ?
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/ProfilePage': (BuildContext context) => new ProfilePage(),
        '/LoginPage': (BuildContext context) => new LoginPage(),
        '/MainPage': (BuildContext context) => new MainPage(),
        '/HomePage': (BuildContext context) => new HomePage(),
        '/SlideNav': (BuildContext context) => new SlideNav(),
        '/IntroSlider': (BuildContext context) => new IntroSlider(),
        '/SignUpPage': (BuildContext context) => new SignUpPage(),
        '/FeedbackPage': (BuildContext context) => new FeedbackPage(),
        '/OTPVerificationPage': (BuildContext context) =>
            new OTPVerificationPage(),
        '/ChatBoxPage': (BuildContext context) => new ChatBoxPage(),
        '/ReferralPage': (BuildContext context) => new ReferralPage(),
      },
    );
  }
}
