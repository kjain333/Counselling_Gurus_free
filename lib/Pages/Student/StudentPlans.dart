import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
final color = [Colors.redAccent,Colors.black];
final names = ['Personal','Amateur','Professional'];
final price = ['Free','₹ 500','₹ 1000'];
List<int> arr1,arr2;
List<int> elevation;
class StudentPlans extends StatefulWidget{
  @override
  _StudentPlans createState() => _StudentPlans();

}
class _StudentPlans extends State<StudentPlans>{
  ScrollController controller;
  double _scrollposition;
  _scrollListener(){
    setState(() {
      _scrollposition = controller.position.pixels;
    });
  }
  @override
  void initState(){
    _scrollposition = 0.0;
    controller  = ScrollController();
    controller.addListener(_scrollListener);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
          controller: controller,
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (context,index){
              if(_scrollposition<MediaQuery.of(context).size.height/2.2)
                {
                    arr1=[1,0,0];
                    arr2=[0,1,1];
                    elevation=[50,0,0];
                }
              else if(_scrollposition<MediaQuery.of(context).size.height)
                {
                  arr1=[0,1,0];
                  arr2 = [1,0,1];
                  elevation=[0,50,0];
                }
              else
                {
                  arr1=[0,0,1];
                  arr2=[1,1,0];
                  elevation=[0,0,50];
                }
              return Padding(
                padding: EdgeInsets.only(left: 50,right: 50,top:20,bottom:10),
                child: Material(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  elevation: elevation[index].toDouble(),
                  child: Container(
                    height: MediaQuery.of(context).size.height/1.5,
                    decoration: BoxDecoration(
                      color: color[arr1[index]],
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 100,
                          child: Text(names[index]+'\n\n  '+price[index],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 20,color: color[arr2[index]]),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50,right: 50),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 40,
                                child: Text('\nFEATURE 1\n',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w100,color: color[arr2[index]]),),

                              ),
                              Container(
                                height: 1,
                                color: color[arr2[index]],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50,right: 50),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 40,
                                child: Text('\nFEATURE 2\n',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w100,color: color[arr2[index]]),),

                              ),
                              Container(
                                height: 1,
                                color: color[arr2[index]],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50,right: 50),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 40,
                                child: Text('\nFEATURE 3\n',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w100,color: color[arr2[index]]),),

                              ),
                              Container(
                                height: 1,
                                color: color[arr2[index]],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        RaisedButton(
                          color: color[arr2[index]],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: (){
                            return null;
                          },
                          child: Text('PURCHASE',style: GoogleFonts.aBeeZee(color: color[arr1[index]]),),
                        )
                      ],
                    ),
                  ),
                )
              );
          }
          ),
    );

  }

}
