import 'package:flutter/material.dart';
import '../Animations/FadeAnimation.dart';
import 'Mentor/StartingPages/LogInMentor.dart';
import '../Resources/Colors.dart' as color;
import 'Mentor/Test.dart';
import 'Student/StartingPages/LoginPage.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/scheduler.dart';

class LoginOptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: const FeatureDiscovery(
      recordStepsInSharedPreferences: false,
      child: LoginOptionsPageStful(),
    ),
  );
}


class LoginOptionsPageStful extends StatefulWidget {
  const LoginOptionsPageStful({Key key}) : super(key: key);

  @override
  _LoginOptionsPageState createState() => _LoginOptionsPageState();
}

class _LoginOptionsPageState extends State<LoginOptionsPageStful> {

  @override
  void initState() {
    // ...
    SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
      FeatureDiscovery.discoverFeatures(
        context,
        const <String>{ // Feature ids for every feature that you want to showcase in order.
          'welcome',
          'student',
          'mentor',
        },
      );
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    var feature1OverflowMode = OverflowMode.clipContent;
    var feature1EnablePulsingAnimation = false;
    var feature3ItemCount = 15;

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
                        2,
                        DescribedFeatureOverlay(
                          featureId: "welcome",
                          tapTarget: Icon(Icons.lightbulb_outline),
                          backgroundColor: Colors.blue,
                          contentLocation: ContentLocation.below,
                          title: const Text('Hello, Counselling Gurus this side!!'),
                          description: const Text(
                              'This is an app tour, tap on blinking objects to continue.\nTo cancel tour, simply tap on remaining part of screen'),

                          child: Text(
                            "Welcome",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                      )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                        1.3,
                        Text(
                          "Login Options",
                          style: TextStyle(color: Colors.white, fontSize: 40),
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
                                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
                                    child: Center(
                                      child: DescribedFeatureOverlay(
                                          featureId: "student",
                                          tapTarget: Icon(Icons.lightbulb_outline),
                                          backgroundColor: Colors.blue,
                                          contentLocation: ContentLocation.below,
                                          title: const Text('I am a Student'),
                                          description: const Text(
                                              'If you are a Student click on this..'),

                                          child: Text("I am a Student", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
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
                                    onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> LogInMentor())),
                                    child: Center(
                                      child: DescribedFeatureOverlay(
                                          featureId: "mentor",
                                          tapTarget: Icon(Icons.lightbulb_outline),
                                          backgroundColor: Colors.blue,
                                          contentLocation: ContentLocation.below,
                                          title: const Text('I am a Mentor'),
                                          description: const Text(
                                              'If you are a Mentor click on this..'),

                                          child: Text("I am a Mentor", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
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
