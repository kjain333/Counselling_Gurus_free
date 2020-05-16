import 'dart:ui';

import 'package:counselling_gurus/Pages/Student/StudentPlans.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future popup(BuildContext context){

return showDialog(

context: context,
builder: (BuildContext context) {
      return AlertDialog(
            elevation: 50,
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(
                color: Colors.amber,

              )
            ),
            content: Container(
                  height: 450,
                  color: Colors.black,
                  child: Column(
                          children: <Widget>[
                            const SizedBox(
                                height: 10,
                            ),
                            ListTile(
                                title: Center(
                                child: Text('Exciting Passes Available',style: GoogleFonts.aBeeZee(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.redAccent),),
                                )
                            ),
                            SizedBox(
                                height: 50,
                                width: 50,
                                child: IconButton(
                                        icon: Icon(Icons.sentiment_very_satisfied,color: Colors.yellow,size: 50,),
                                        onPressed: (){
                                              return null;
                                              },
                                        ),
                            ),
                            SizedBox(
                                height: 20,
                            ),
                            ListTile(

                                title:Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                      child: Text('Personal',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 18,color: Colors.white),),
                                    ),
                                    SizedBox(
                                      height: 15,
                                      child: Text('Free\n',style: GoogleFonts.aBeeZee(fontSize: 12,fontWeight: FontWeight.w100,color: Colors.white),),
                                    ),
                                  ],
                                ),
                              subtitle: Padding(
                                  padding: EdgeInsets.only(left: 30,right: 30),
                                  child: Container(
                                    height: 1,
                                    color: Colors.white,
                                  ),
                                ),
                            ),
                            ListTile(

                                title:Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                      child: Text('Amateur',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 18,color: Colors.white),),
                                    ),
                                    SizedBox(
                                      height: 15,
                                      child: Text('₹ 500\n',style: GoogleFonts.aBeeZee(fontSize: 12,fontWeight: FontWeight.w100,color: Colors.white),),
                                    ),
                                  ],
                                ),
                              subtitle: Padding(
                                padding: EdgeInsets.only(left: 30,right: 30),
                                child: Container(
                                  height: 1,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ListTile(
                                title:Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                      child: Text('Professional',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 18,color: Colors.white),),
                                    ),
                                    SizedBox(
                                      height: 15,
                                      child: Text('₹ 1000\n',style: GoogleFonts.aBeeZee(fontSize: 12,fontWeight: FontWeight.w100,color: Colors.white),),
                                    ),
                                  ],
                                ),
                              subtitle: Padding(
                                padding: EdgeInsets.only(left: 30,right: 30),
                                child: Container(
                                  height: 1,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                                height: 20,
                            ),
                            RaisedButton(
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                ),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentPlans()));
                                },
                                color: Colors.pinkAccent,
                                textColor: Colors.white,
                                child: Text('MORE DETAILS',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w500,fontSize: 20),),
                            )
                  ],
            ),
      )
      );
    }
  );
}