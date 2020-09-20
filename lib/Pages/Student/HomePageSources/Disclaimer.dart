import 'package:counselling_gurus/Pages/Student/PdfViewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Disclaimer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Text('DISCLAIMER',style: GoogleFonts.aBeeZee(fontSize: 24,fontWeight: FontWeight.w900),),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text("We have put our best efforts to get the best information out from various sources. If there is any discrepancy in any information, please tell us as soon as possible. We will rectify that.\nThis app is solely for the purpose of giving information. The final decision should be made by the candidate.",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w200,fontSize: 15),),
            )
          ],
        ),
      ),
    );
  }

}