import 'dart:async';
import 'package:counselling_gurus/Animations/FadeAnimation1.dart';
import 'package:counselling_gurus/Pages/LoginOptionsPage.dart';
import 'package:counselling_gurus/Resources/SlideTransition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'LoginOptionsPageNew.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4),(){
      Navigator.push(context, MySlide(builder: (context) => LoginOptionsNew(),),);
      print(animation.value);
    });
    controller = (AnimationController(duration: Duration(seconds: 1),vsync: this));
    animation = Tween(begin: 300.0,end: 200.0).animate(CurvedAnimation(parent: controller,curve: Curves.easeInToLinear));
    Future.delayed(Duration(seconds: 1),(){
      setState(() {
        controller.forward();
        print(animation.value);
      });
    });
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context,child){
        return Scaffold(
            body: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/SplashScreen.png',),
                        fit: BoxFit.fill,
                      )
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: Container(
                        height: animation.value,
                        width: animation.value,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/splashpic.png'),
                              fit: BoxFit.fill,
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: FadeAnimation1(
                        3,Text("COUNSELLING GURUS",style: GoogleFonts.aBeeZee(fontSize: 25,fontWeight: FontWeight.bold,color: Color.fromRGBO(112,112,112,1)),)
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: FadeAnimation1(
                          3,Text("HELP YOU CHOOSE",style: GoogleFonts.aBeeZee(fontSize: 30,fontWeight: FontWeight.w300,color: Color.fromRGBO(112,112,112,1)),)
                      ),
                    ),
                    Center(
                      child: FadeAnimation1(
                          3,Text("THE BEST",style: GoogleFonts.aBeeZee(fontSize: 30,fontWeight: FontWeight.w300,color: Color.fromRGBO(112,112,112,1)),)
                      ),
                    ),
                  ],
                )
              ],
            )
        );
      },
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
