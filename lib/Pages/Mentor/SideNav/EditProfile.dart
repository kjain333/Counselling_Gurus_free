import 'package:counselling_gurus/Resources/Colors.dart' as color;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class EditProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 320,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  height: 260,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          color.bgGrad,
                          color.bgGrad1,
                          color.bgGrad2,
                          color.bgGrad3
                        ],
                        stops: [0.2,0.5,0.7,1],
                      ),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 40,
                      child: Center(child: Text('Edit Profile',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: (){
                        return null;
                      },
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/profile.png')),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
                padding: EdgeInsets.only(left:30,right: 30),
                child: Material(
                  elevation: 30,
                  borderRadius: BorderRadius.circular(30),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                         borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'This where the user will put few lines of bio. Tap here to edit the details.',
                      //prefixText: 'This where the user will put few lines of bio. Tap here to edit the details.',
                    ),
                  ),
                )
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30,right: 30,top: 0,bottom: 0),
              child: Material(
                elevation: 30,
                borderRadius: BorderRadius.circular(20),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Name',
                    //labelText: 'USERNAME',
                    prefixIcon: Icon(Icons.person_outline),
                  ),

                ),
              )
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30,right: 30,top: 0,bottom: 0),
              child: Material(
                elevation: 30,
                borderRadius: BorderRadius.circular(20),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'New Delhi,Delhi',
                    //labelText: 'LOCATION',
                    prefixIcon: Icon(Icons.my_location),
                  ),

                ),
              )
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: Material(
                elevation: 30,
                borderRadius: BorderRadius.circular(20),
                child: TextField(

                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'abcd@gmail.com',
                    //labelText: 'EMAIL ID',
                    prefixIcon: Icon(Icons.mail_outline),
                  ),

                ),
              )
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: Material(
                elevation: 30,
                borderRadius: BorderRadius.circular(20),
                child: TextField(

                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: '9876543210',
                   // labelText: 'CONTACT',
                    prefixIcon: Icon(Icons.phone_android),
                  ),

                ),
              )
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: (){
                return null;
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.purpleAccent,
              child: Text('SAVE CHANGES',style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 18),),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      )
    );
  }

}