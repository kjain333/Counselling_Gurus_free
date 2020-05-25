import 'package:counselling_gurus/Animations/FadeAnimation.dart';
//import 'package:counselling_gurus/Pages/Mentor/LogInMentor.dart';
import 'package:counselling_gurus/Pages/Student/MainPage.dart';
import 'package:flutter/material.dart';
import '../../../Resources/Colors.dart' as color;
import 'package:counselling_gurus/Pages/Student/StartingPages/Stream.dart';
class StreamSelectPage extends StatefulWidget {
  @override
  _StreamSelectPageState createState() => _StreamSelectPageState();
}
class _StreamSelectPageState extends State<StreamSelectPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                color.bgGrad,
                color.bgGrad1,
                color.bgGrad2,
                color.bgGrad3
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Text(
                          "Select Stream",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                        1.3,
                        Text(
                          "Welcome Back",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 60),
                          FadeAnimation(1.2,
                              InkWell(
                                child: Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 50),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: color.buttonsMain
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      SetStream(0);
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => MainPage()));
                                    },
                                    child: Center(
                                      child: Text("As an Engineering Aspirant", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(height: 60,),
                          FadeAnimation(1.3,
                              InkWell(
                                child: Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 50),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: color.buttonsMain
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                      SetStream(1);
                                      Navigator.push(context,MaterialPageRoute(builder: (context)=> MainPage()));
                                    },
                                    child: Center(
                                      child: Text("As a Medical Aspirant", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
