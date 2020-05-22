import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditions extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text('TERMS AND CONDITIONS',style: GoogleFonts.aBeeZee(fontSize: 25,fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }

}