import 'package:counselling_gurus/Pages/Student/StartingPages/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Mentor/StartingPages/LogInMentor.dart';

class LoginOptionsNew extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/LoginOptions.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text('Hi, There',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 30,color: Color.fromRGBO(21,9,111, 1)),),
              ),
              Center(
                child: Text('Get Your Dream College',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w200,fontSize: 25,color: Color.fromRGBO(21,9,111, 1)),),
              ),
              Center(
                child: Text('Like Thousand Others.',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w200,fontSize: 25,color: Color.fromRGBO(21,9,111, 1)),),
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            left: MediaQuery.of(context).size.width/2-100,
            child: Column(
              children: <Widget>[
                Center(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: Color.fromRGBO(255, 8, 105, 1),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => (LoginPage()),),);
                    },
                    child:  Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 30,),
                          Icon(Icons.person,color: Colors.white,),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Student",style: GoogleFonts.aBeeZee(fontSize: 18,color: Colors.white),),
                          SizedBox(width: 30,),
                        ],
                      ),
                    )
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: Color.fromRGBO(82,0,140,1),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LogInMentor(),),);
                    },
                    child:  Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 30,),
                          Icon(Icons.supervisor_account,color: Colors.white,),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Mentor ",style: GoogleFonts.aBeeZee(fontSize: 18,color: Colors.white),),
                          SizedBox(width: 30,),
                        ],
                      ),
                    )
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }

}