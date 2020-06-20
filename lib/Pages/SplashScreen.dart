import 'dart:async';
import 'package:counselling_gurus/Pages/LoginOptionsPage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginOptionsPage()));
  //  Navigator.of(context).pushReplacementNamed('/LoginOptionsPage');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/splashpic.png',
                scale: 0.8,),
            SizedBox(height: 5.0),
            Text(
              "Counselling Gurus",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600),
            ),

          ],
        ),
      ),
    );
  }
}



//  @override
//  void initState() {
//    super.initState();
//    Timer(
//        Duration(seconds: 5),
//        () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginOptionsPage()))
//    );
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      body: Center(
//        child: Column(
//          children: <Widget>[
//            Image.asset('assets/images/splashpic.png'),
//            SizedBox(height: 5.0),
//            Text(
//              "Counselling Gurus",
//              style: TextStyle(
//                  color: Colors.black,
//                  fontSize: 30.0,
//                  fontWeight: FontWeight.w600),
//            ),
//
//          ],
//        ),
//      ),
//    );
//  }
//}
