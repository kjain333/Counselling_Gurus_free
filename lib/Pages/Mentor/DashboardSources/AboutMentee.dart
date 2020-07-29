import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMentee extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width-20,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50)),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 80,
                        ),
                        Center(
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                image: AssetImage("assets/images/profile.png")
                              )
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text("Mentee Name",style: GoogleFonts.aBeeZee(fontSize: 18,fontWeight: FontWeight.w300,color: Colors.white),),
                        ),
                        Center(
                          child: Text("Category",style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w200,color: Colors.white),),
                        ),
                        Center(
                          child: Text("General Rank",style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w200,color: Colors.white),),
                        ),
                        Center(
                          child: Text("Category Rank",style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w200,color: Colors.white),),
                        ),
                        Center(
                          child: Text("abcd@gmail.com",style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w200,color: Colors.white),),
                        ),
                        Center(
                          child: Text("9876543210",style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w200,color: Colors.white),),
                        ),
                        Center(
                          child: Text("Plan Opted",style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w200,color: Colors.white),),
                        ),
                        SizedBox(
                          height: 20,
                        )

                      ],
                    )
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
            ),
            GestureDetector(
              onTap: (){
                return null;
              },
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 30,right: 30),
                leading: Icon(Icons.event),
                title: Text("Schedule Video Meeting",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w300),),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
            ),
            GestureDetector(
              onTap: (){
                return null;
              },
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 30,right: 30),
                leading: Icon(Icons.mail),
                title: Text("Chat Now",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w300),),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
            ),
            GestureDetector(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return Scaffold(
                        floatingActionButton: FloatingActionButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.check,color: Colors.white,),
                        ),
                        backgroundColor: Colors.transparent,
                        body: Center(
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width-100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white
                            ),
                            child: TextField(
                              maxLines: 7,
                              style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w200,fontSize: 18),
                              decoration: InputDecoration(
                                hintText: "Let us know more about the mentee assigned to you",
                                hintStyle: GoogleFonts.aBeeZee(fontWeight: FontWeight.w200,fontSize: 18),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              )
                            ),
                          ),
                        ),
                      );
                    }
                );
              },
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 30,right: 30),
                leading: Icon(Icons.receipt),
                title: Text("Send Report",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w300),),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }

}