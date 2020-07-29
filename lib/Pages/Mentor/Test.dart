import 'package:counselling_gurus/Animations/FadeAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:counselling_gurus/Resources/Colors.dart' as color;
import 'package:google_fonts/google_fonts.dart';
import 'StartingPages/IntroSlider.dart';
import 'StartingPages/OTPVerificationPageMentor.dart';
import 'StartingPages/SignUpMentor.dart';

class Test extends StatefulWidget{
  _Test createState() => _Test();
}
class _Test extends State<Test> with  TickerProviderStateMixin{
 // static double height = MediaQuery.of(context).size.height;
  Animation animation,animation1,transformationAnim;
  AnimationController animationController;
  @override
  void initState() {
    animationController = (AnimationController(duration: Duration(seconds: 2),vsync: this));

   // transformationAnim = Tween(begin: 0.0,end: 150.0).animate(CurvedAnimation(parent: animationController,curve: Curves.bounceInOut));

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    animation = Tween(begin: 0.0,end: MediaQuery.of(context).size.height).animate(CurvedAnimation(parent: animationController,curve: Curves.easeInOutQuint));
    animation1 = Tween(begin: 560.0,end: 0.0).animate(CurvedAnimation(parent: animationController,curve: Curves.ease));
    int state=0;
    final code = ['OR Sign Up','OR Log In'];
    return AnimatedBuilder(
       animation: animationController,
       builder: (BuildContext context,Widget child){
         return Scaffold(
           body: Stack(

             children: <Widget>[

               Container(
                 width: double.infinity,
               //  color: Colors.purpleAccent,
                 child: Stack(
                     children: <Widget>[
                      SingleChildScrollView(
                        child: Column(
                         children: <Widget>[
                           Container(
                             height: MediaQuery.of(context).size.height,
                             width: MediaQuery.of(context).size.width,
                             decoration: BoxDecoration(
                               image: DecorationImage(
                                 image: AssetImage('assets/images/background1.png'),
                                 fit: BoxFit.fill,
                               ),
                             ),
                           )
                         ],
                       ),
                      ),
                       (animationController.status!=AnimationStatus.dismissed)?Container(height: 0,width: 0,):SingleChildScrollView(
                         child: Column(
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
                                       "Login",
                                       style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 40),
                                     )),
                                 SizedBox(
                                   height: 10,
                                 ),
                                 FadeAnimation(
                                     1.3,
                                     Text(
                                       "Welcome Back",
                                       style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 18),
                                     )),

                               ],
                             ),
                           ),
                           SizedBox(height: 50),
                           Padding(
                             padding: EdgeInsets.only(left: 40,right: 40,top: 20),
                             child: FadeAnimation(
                               1.5,TextField(
                               cursorColor: Colors.amber,
                               style:  GoogleFonts.aBeeZee(color: Colors.amber,fontSize: 18),
                               decoration: InputDecoration(
                                 hintText: 'Enter Email Address',
                                 hintStyle: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 18),
                                 focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(20),
                                   borderSide: BorderSide(color: Colors.amber),
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(20),
                                   borderSide: BorderSide(color: Colors.white),
                                 ),
                               ),
                             ),
                             )
                           ),
                           Padding(
                               padding: EdgeInsets.only(left: 40,right: 40,top: 20),
                               child: FadeAnimation(
                                 1.5,TextField(
                                 cursorColor: Colors.amber,
                                 style:  GoogleFonts.aBeeZee(color: Colors.amber,fontSize: 18),
                                 decoration: InputDecoration(
                                   hintText: 'Enter Password',
                                   hintStyle: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 18),
                                   focusedBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(20),
                                     borderSide: BorderSide(color: Colors.amber),
                                   ),
                                   enabledBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(20),
                                     borderSide: BorderSide(color: Colors.white),
                                   ),
                                 ),
                               ),
                               )
                           ),
                         ],
                       )
                       ),
                       (animationController.status!=AnimationStatus.dismissed)?Container(height: 0,width: 0,):Positioned(
                          top: 551,
                          right: 50,
                          child: FadeAnimation(
                            1.7,FloatingActionButton(
                            backgroundColor: Colors.purpleAccent,
                            child: Icon(Icons.arrow_forward,size: 30,),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => IntroSliderMentor()));
                            },
                          ),
                          )
                       )
                     ],
                   ),
               ),
               Positioned(
                 top: animation1.value,
                 left: 0,
                 child: Container(
                   color: Colors.lightBlueAccent,
                   height: animation.value,
                   width: MediaQuery.of(context).size.width,
                   child: Stack(
                     children: <Widget>[
                       SingleChildScrollView(
                         child: Column(
                           children: <Widget>[
                             Container(
                               height: animation.value,
                               width: MediaQuery.of(context).size.width,
                               decoration: BoxDecoration(
                                 image: DecorationImage(
                                   image: AssetImage('assets/images/background.png'),
                                   fit: BoxFit.fill,
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                       (animationController.status!=AnimationStatus.completed)?Container(height: 0,width: 0,):SingleChildScrollView(
                           child: Column(
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
                                           "Sign In",
                                           style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 40),
                                         )),
                                     SizedBox(
                                       height: 10,
                                     ),
                                     FadeAnimation(
                                         1.3,
                                         Text(
                                           "Welcome Back",
                                           style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 18),
                                         )),

                                   ],
                                 ),
                               ),
                               SizedBox(height: 20),
                               Padding(
                                   padding: EdgeInsets.only(left: 40,right: 40,top: 20),
                                   child: FadeAnimation(
                                     1.5,TextField(
                                     cursorColor: Colors.amber,
                                     style:  GoogleFonts.aBeeZee(color: Colors.amber,fontSize: 18),
                                     decoration: InputDecoration(
                                       hintText: 'Enter Full Name',
                                       hintStyle: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 18),
                                       focusedBorder: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(20),
                                         borderSide: BorderSide(color: Colors.amber),
                                       ),
                                       enabledBorder: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(20),
                                         borderSide: BorderSide(color: Colors.white),
                                       ),
                                     ),
                                   ),
                                   )
                               ),
                               Padding(
                                   padding: EdgeInsets.only(left: 40,right: 40,top: 20),
                                   child: FadeAnimation(
                                     1.5,TextField(
                                     cursorColor: Colors.amber,
                                     style:  GoogleFonts.aBeeZee(color: Colors.amber,fontSize: 18),
                                     decoration: InputDecoration(
                                       hintText: 'Enter Contact Number',
                                       hintStyle: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 18),
                                       focusedBorder: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(20),
                                         borderSide: BorderSide(color: Colors.amber),
                                       ),
                                       enabledBorder: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(20),
                                         borderSide: BorderSide(color: Colors.white),
                                       ),
                                     ),
                                   ),
                                   )
                               ),
                               Padding(
                                   padding: EdgeInsets.only(left: 40,right: 40,top: 20),
                                   child: FadeAnimation(
                                     1.5,TextField(
                                     cursorColor: Colors.amber,
                                     style:  GoogleFonts.aBeeZee(color: Colors.amber,fontSize: 18),
                                     decoration: InputDecoration(
                                       hintText: 'Enter Email Address',
                                       hintStyle: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 18),
                                       focusedBorder: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(20),
                                         borderSide: BorderSide(color: Colors.amber),
                                       ),
                                       enabledBorder: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(20),
                                         borderSide: BorderSide(color: Colors.white),
                                       ),
                                     ),
                                   ),
                                   )
                               ),
                               Padding(
                                   padding: EdgeInsets.only(left: 40,right: 40,top: 20),
                                   child: FadeAnimation(
                                     1.5,TextField(
                                     cursorColor: Colors.amber,
                                     style:  GoogleFonts.aBeeZee(color: Colors.amber,fontSize: 18),
                                     decoration: InputDecoration(
                                       hintText: 'Enter Password',
                                       hintStyle: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 18),
                                       focusedBorder: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(20),
                                         borderSide: BorderSide(color: Colors.amber),
                                       ),
                                       enabledBorder: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(20),
                                         borderSide: BorderSide(color: Colors.white),
                                       ),
                                     ),
                                   ),
                                   )
                               ),

                             ],
                           )
                       ),
                       (animationController.status!=AnimationStatus.completed)?Container(height: 0,width: 0,):Positioned(
                           top: 551,
                           right: 50,
                           child: FadeAnimation(
                             1.7,FloatingActionButton(
                             backgroundColor: Colors.purpleAccent,
                             child: Icon(Icons.arrow_forward,size: 30,),
                             onPressed: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context) => IntroSliderMentor()));
                             },
                           ),
                           )
                       ),

                     ],
                   ),
                 ),
               ),
               Positioned(
                 top: 551,
                 left: 0,
                 child: Container(
                   width: 150,
                   child: FlatButton(
                     color: Colors.indigo,
                     onPressed: (){
                       if(state==0)
                         animationController.forward();
                       else
                         animationController.reverse();
                       if(state==0)
                         state=1;
                       else
                         state=0;
                     },
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
                     ),
                     child: Text((animation.status==AnimationStatus.completed||animation.status==AnimationStatus.dismissed)?code[state]:'',style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 18),),
                   ),
                 )
               ),

             ],
           ),

         );
       },
    );
  }

}
