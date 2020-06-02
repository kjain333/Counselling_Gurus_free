import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassword extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Text('WELCOME',style: GoogleFonts.aBeeZee(fontSize: 25,fontWeight: FontWeight.bold)),
          Text('Seems like you forgot your old password. Don\'t worry we are there to help you.',style: GoogleFonts.aBeeZee(fontSize: 18,fontWeight: FontWeight.w300),),
          SizedBox(
            height: 50,
          ),
          Text('New Password',style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w100),),
          Padding(
            padding: EdgeInsets.all(20),
            child: Material(
              borderRadius: BorderRadius.circular(30),
              elevation: 30,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text('Confirm Password',style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w100),),
          Padding(
            padding: EdgeInsets.all(20),
            child: Material(
              borderRadius: BorderRadius.circular(30),
              elevation: 30,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text('CHANGE',style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 18),),
            color: Colors.purpleAccent,
            onPressed: (){
              if(false)//when new and confirm matches
              showDialog(
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    elevation: 50,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        color: Colors.amberAccent,
                      )
                    ),
                    content: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        color: Colors.black,
                        height: 70,
                        child: Column(
                          children: <Widget>[
                            Text('Congrats',style: GoogleFonts.aBeeZee(color: Colors.amber,fontSize: 25,fontWeight: FontWeight.bold),),
                            Text('Password reset Successful',style: GoogleFonts.aBeeZee(color: Colors.amber,fontSize: 20,fontWeight: FontWeight.w100),),
                          ],
                        ),
                      ),
                    )
                  );
                }
              );
              else
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                          elevation: 50,
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(
                                color: Colors.amberAccent,
                              )
                          ),
                          content: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              color: Colors.black,
                              height: 70,
                              child: Column(
                                children: <Widget>[
                                  Text('Sorry',style: GoogleFonts.aBeeZee(color: Colors.amber,fontSize: 25,fontWeight: FontWeight.bold),),
                                  Text('Seems like there was some error. Please try again',style: GoogleFonts.aBeeZee(color: Colors.amber,fontSize: 15,fontWeight: FontWeight.w100),),
                                ],
                              ),
                            ),
                          )
                      );
                    }
                );
            },
          )
        ],
      ),
    );
  }

}