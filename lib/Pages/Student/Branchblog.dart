import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:vector_math/vector_math.dart' show radians;

class Branchblog extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: SizedBox.expand(child: RadialMenu(),),
      ),
    );
  }
}
class RadialMenu extends StatefulWidget{
  @override
  createState() {
    return _RadialMenuState();
  }
}
class _RadialMenuState extends State<RadialMenu> with SingleTickerProviderStateMixin{
  AnimationController controller;
  @override
  void initState(){
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 900),vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return RadialAnimation(controller: controller);
  }
}
enum _BgProps{color1,color2}
class RadialAnimation extends StatelessWidget{

  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;
  final Animation<double> rotation;
  RadialAnimation({Key key,this.controller}):
  scale = Tween<double>(begin: 0.5,
          end: -1.8).animate(CurvedAnimation( parent: controller,curve: Curves.fastOutSlowIn),),
  translation = Tween<double>(begin: 0,end: 130.0).animate(CurvedAnimation(parent: controller,curve: Curves.linear),),
  rotation = Tween<double>(begin: 0,end: 360).animate(CurvedAnimation(parent: controller,curve: Interval(0.3,0.9,curve: Curves.decelerate),),),
  super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_BgProps>()..add(_BgProps.color1,Color(0xffD38312).tweenTo(Colors.lightBlue.shade900))
                                        ..add(_BgProps.color2,Color(0xffA83279).tweenTo(Colors.blue.shade600));
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          child: MirrorAnimation<MultiTweenValues<_BgProps>>(
            tween: tween,
            duration: 3.seconds,
            builder: (context,child,value){
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      value.get(_BgProps.color1),
                      value.get(_BgProps.color2)
                    ]
                  )
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 400,
          left: 150,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context,builder){
              return Transform.rotate(angle: radians(rotation.value),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      _buildButton(0,color1: Colors.green,color2: Colors.lightGreenAccent,name: 'COMPUTER SCIENCE'),
                      _buildButton(60,color1: Colors.deepPurple,color2: Colors.purpleAccent,name: 'ELECTRONICS'),
                      _buildButton(120,color1: Colors.indigo,color2: Colors.lightBlueAccent,name: 'MECHANICAL'),
                      _buildButton(180,color1: Colors.deepOrange,color2: Colors.orangeAccent,name: 'CHEMICAL'),
                      _buildButton(240,color1: Colors.red,color2: Colors.pinkAccent,name: 'BIOTECHNOLOGY'),
                      _buildButton(300,color1: Colors.black,color2: Colors.grey,name: 'MATHS AND COMPUTING'),

                      Transform.scale(
                        scale: scale.value+0.5,
                        child: FloatingActionButton(

                          heroTag: 'btn1',
                          child: Icon(Icons.clear),
                          onPressed: _close,
                          backgroundColor: Colors.red,
                        ),
                      ),
                      Transform.scale(
                        scale: scale.value+1.8,
                        child: FloatingActionButton(
                          child: Icon(Icons.add),
                          heroTag: 'btn2',
                          onPressed: _open,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  )
              );
            },
          ),
        )
      ],
    );
  }
  _buildButton(double angle,{Color color1,Color color2,String name}){
    final double rad = radians(angle);
    return Transform(
      transform: Matrix4.identity()..translate(
          (translation.value)*cos(rad),
          (translation.value)*sin(rad),
    ),
      child: Container(
        height: 60,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [color1,color2],
          ),
        ),
        child: Padding(padding: EdgeInsets.all(15),child: Text(name,style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 10,color: Colors.white),),)
      ),
    );

  }
  _open(){
    controller.forward();
  }
  _close(){
    controller.reverse();
  }

}