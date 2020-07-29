import 'package:counselling_gurus/Animations/FadeAnimation.dart';
import 'package:counselling_gurus/Pages/Mentor/Test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Test1 extends StatefulWidget{
  _Test1 createState()=> _Test1();
}
final string = ['C','O','U','N','S','E','L','L','I','N','G'];
final string1 = ['G','U','R','U','S'];
var image = "assets/images/background.png";
final color = [Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white];
class _Test1 extends State<Test1> with SingleTickerProviderStateMixin{
  Animation animation;
  AnimationController animationController;
  int ctr=0,ctr1=0;
  @override
  void initState() {
    animationController = (AnimationController(duration: Duration(seconds: 2),vsync: this));
    animation = Tween(begin: 0.0,end: 160).animate(CurvedAnimation(parent: animationController,curve: Curves.easeInToLinear));
    Future.delayed(Duration(seconds: 1),(){
      setState(() {
        animationController.forward();
        image = "assets/images/background.png";
      });
    });
    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        image = "assets/images/background.png";
      });
    });
    Future.delayed(Duration(seconds: 4),(){
      setState(() {
        animationController.reverse();
        ctr1=1;
        image = "assets/images/background.png";
      });
    });
    Future.delayed(Duration(seconds: 6),(){
      setState(() {
        image = "assets/images/background.png";
      });
    });
    Future.delayed(Duration(seconds: 7),(){
      setState(() {
        ctr=1;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: animationController,
      builder: (context,child){
        return Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/background.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: (ctr==0)?Column(
                        children: <Widget>[
                          SizedBox(
                            height: 200,
                          ),
                          Stack(
                            children: <Widget>[
                             /* Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/splashpic.png"),
                                      fit: BoxFit.fill,
                                    )
                                ),
                              ),*/
                              RotationTransition(
                                turns: Tween(begin: 0.0,end: 8.0).animate(animationController),
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(image),
                                        fit: BoxFit.fill,
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                  style: GoogleFonts.aBeeZee(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w900),
                                  children: <TextSpan>[
                                    TextSpan(text: 'C',style: GoogleFonts.aBeeZee(fontSize: 25,color: (animation.value>10)?Colors.amber:Colors.white,fontWeight: FontWeight.w900),),
                                    TextSpan(text: 'O',style: GoogleFonts.aBeeZee(fontSize: 25,color: (animation.value>20)?Colors.amber:Colors.white,fontWeight: FontWeight.w900),),
                                    TextSpan(text: 'U',style: GoogleFonts.aBeeZee(fontSize: 25,color: (animation.value>30)?Colors.amber:Colors.white,fontWeight: FontWeight.w900),),
                                    TextSpan(text: 'N',style: GoogleFonts.aBeeZee(fontSize: 25,color: (animation.value>40)?Colors.amber:Colors.white,fontWeight: FontWeight.w900),),
                                    TextSpan(text: 'S',style: GoogleFonts.aBeeZee(fontSize: 25,color: (animation.value>50)?Colors.amber:Colors.white,fontWeight: FontWeight.w900),),
                                    TextSpan(text: 'E',style: GoogleFonts.aBeeZee(fontSize: 25,color: (animation.value>60)?Colors.amber:Colors.white,fontWeight: FontWeight.w900),),
                                    TextSpan(text: 'L',style: GoogleFonts.aBeeZee(fontSize: 25,color: (animation.value>70)?Colors.amber:Colors.white,fontWeight: FontWeight.w900),),
                                    TextSpan(text: 'L',style: GoogleFonts.aBeeZee(fontSize: 25,color: (animation.value>80)?Colors.amber:Colors.white,fontWeight: FontWeight.w900),),
                                    TextSpan(text: 'I',style: GoogleFonts.aBeeZee(fontSize: 25,color: (animation.value>90)?Colors.amber:Colors.white,fontWeight: FontWeight.w900),),
                                    TextSpan(text: 'N',style: GoogleFonts.aBeeZee(fontSize: 25,color: (animation.value>100)?Colors.amber:Colors.white,fontWeight: FontWeight.w900),),
                                    TextSpan(text: 'G',style: GoogleFonts.aBeeZee(fontSize: 25,color: (animation.value>109)?Colors.amber:Colors.white,fontWeight: FontWeight.w900),),
                                  ]
                              ),
                            ),
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                  style: GoogleFonts.aBeeZee(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w900),
                                  children: <TextSpan>[
                                    TextSpan(text: 'G',style: GoogleFonts.aBeeZee(fontSize: 25,color: (animation.value>120)?Colors.amber:Colors.white,fontWeight: FontWeight.w900),),
                                    TextSpan(text: 'U',style: GoogleFonts.aBeeZee(fontSize: 25,color: (animation.value>130)?Colors.amber:Colors.white,fontWeight: FontWeight.w900),),
                                    TextSpan(text: 'R',style: GoogleFonts.aBeeZee(fontSize: 25,color: (animation.value>140)?Colors.amber:Colors.white,fontWeight: FontWeight.w900),),
                                    TextSpan(text: 'U',style: GoogleFonts.aBeeZee(fontSize: 25,color: (animation.value>150)?Colors.amber:Colors.white,fontWeight: FontWeight.w900),),
                                    TextSpan(text: 'S',style: GoogleFonts.aBeeZee(fontSize: 25,color: (animation.value>159)?Colors.amber:Colors.white,fontWeight: FontWeight.w900),),

                                  ]
                              ),
                            ),
                          ),
                        ],
                      ):Column(
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
                                1.0,
                                Text(
                                  "Welcome",
                                  style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 25),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                                1.2,
                                Text(
                                  "Login Options",
                                  style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 25),
                                )),
                            SizedBox(
                              height: 80,
                            ),
                            FadeAnimation(
                              1.3,Center(
                              child: FlatButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Test()));
                                },
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(color: Colors.white)
                                ),
                                child: Text('As a Student',style: GoogleFonts.aBeeZee(fontSize: 18,color: Colors.white),),
                              ),

                            ),
                            ),
                            FadeAnimation(
                              1.3,Center(
                              child: FlatButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Test()));
                                },
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(color: Colors.white)
                                ),
                                child: Text('As a Mentor',style: GoogleFonts.aBeeZee(fontSize: 18,color: Colors.white),),
                              ),

                            ),
                            ),
                          ],
                        ),
                      ),
                      ],
                    )
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },

    );
  }

}
class MyPainter extends CustomPainter{
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;
  MyPainter({this.lineColor,this.completeColor,this.completePercent,this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center  = new Offset(size.width/2, size.height/2);
    double radius  = min(size.width/2,size.height/2);
    canvas.drawCircle(
        center,
        radius,
        line
    );
    double arcAngle = 2*3.14* (completePercent/100);
    canvas.drawArc(
        new Rect.fromCircle(center: center,radius: radius),
        -3.14/2,
        arcAngle,
        false,
        complete
    );
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
double min(double a,double b){
  return (a<b)?a:b;
}