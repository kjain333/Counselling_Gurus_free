import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../PdfViewer.dart';
var title = ["PHYSICS for IIT-JEE","MATHS for IIT-JEE","CHEMISTRY for IIT-JEE"];
var subt = ["electromagnetism,optics,mechanics,kinematics and much more.","Trigonometry,Calculus,Probability,Determinants and Matrices and much more.","Stoichiometry,Reaction Kinematics,Organic Chemistry,Periodic Analysis and much more"];
class NotesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text('Put the Concepts Right With',style: GoogleFonts.aBeeZee(fontSize: 22,fontWeight: FontWeight.bold),),
            ),
            Center(
              child: Text('Quick Revision Notes',style: GoogleFonts.aBeeZee(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.blue),),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.width-60,
              width: MediaQuery.of(context).size.width-60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Notes.png')
                )
              ),
            ),
            GestureDetector(
              child: ListTile(
                contentPadding: EdgeInsets.all(20),
                title: Text(title[0],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 18),),
                subtitle: Text(subt[0],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w100,fontSize: 15),),
                trailing: Icon(Icons.arrow_forward),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectNote("Physics")));
              },
            ),
            GestureDetector(
              child: ListTile(
                contentPadding: EdgeInsets.all(20),
                title: Text(title[1],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 18),),
                subtitle: Text(subt[1],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w100,fontSize: 15),),
                trailing: Icon(Icons.arrow_forward),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectNote("Maths")));
              },
            ),
            GestureDetector(
              child: ListTile(
                contentPadding: EdgeInsets.all(20),
                title: Text(title[2],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 18),),
                subtitle: Text(subt[2],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w100,fontSize: 15),),
                trailing: Icon(Icons.arrow_forward),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectNote("Chemistry")));
              },
            ),
          ],
        ),
      ),
    );
  }

}
class SubjectNote extends StatelessWidget{
  SubjectNote(this.subject);
  final String subject;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(subject,style: GoogleFonts.aBeeZee(fontSize: 22,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 10,
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.all(20),
                    itemCount: 5,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: EdgeInsets.all(20),
                        child: Material(
                          elevation: 20,
                          child: Container(
                              width: MediaQuery.of(context).size.width-40,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width-40,
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Text('Chapter Name',style: GoogleFonts.aBeeZee(fontSize: 18,fontWeight: FontWeight.w300),),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Text('This is a short description about each chapter. Lets hope this is only a few lines 2-3 lines long',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w100),),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(20),
                                          child: GestureDetector(
                                            child: Container(
                                              width: 80,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius: BorderRadius.circular(20)
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Center(
                                                  child: Text("View",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.amber),),
                                                ),
                                              ),
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>PdfViewer1()));
                                            },
                                          )
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 20,
                                    child: Container(
                                      width: 30,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      right: 20,
                                      top: 10,
                                      child: Icon(Icons.star,color: Colors.amber,size: 30,)
                                  ),
                                ],
                              )
                          ),
                        ),
                      );
                    }
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}