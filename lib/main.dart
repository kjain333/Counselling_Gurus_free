
import 'package:wiredash/wiredash.dart';
import 'package:counselling_gurus/Pages/Student/SlideNav.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/SplashScreen.dart';
import 'Pages/Student/HomePageSources/NewCollegesList.dart';
import 'Pages/Student/StartingPages/IntroSlider.dart';
import 'Pages/Student/MainPage.dart';
import 'Pages/Student/Fragments/HomePage.dart';
import 'Pages/Student/StartingPages/SignUpPage.dart';
var email;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs.getString('email');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: "counsellinggurusapp-fhexrwn",
      secret: "fsiy94mak9nrbc30wdzyxkjg8ty5f3mj",
      navigatorKey: _navigatorKey,
      options: WiredashOptionsData(showDebugFloatingEntryPoint: false),
      child: MaterialApp(
          navigatorKey: _navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Counselling Gurus',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // email == null ?
          home: (email!=null)?MainPage():SplashScreen(),
          routes: <String, WidgetBuilder>{
            '/MainPage': (BuildContext context) => new MainPage(),
            '/HomePage': (BuildContext context) => new HomePage(),
            '/SlideNav': (BuildContext context) => new SlideNav(),
            '/IntroSlider': (BuildContext context) => new IntroSlider(),
            '/SignUpPage': (BuildContext context) => new SignUpPage(),
          },
        ),
    );
  }
}
