import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQAnswer extends StatelessWidget{
  FAQAnswer(this.question,this.answer);
  String question,answer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text('F.A.Q.',style: TextStyle(fontWeight: FontWeight.w900,fontFamily: 'icons',fontSize: 30,color: Colors.purple),),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Material(
                elevation: 30,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width-60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(120, 255, 0, 0),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 20,
                        top: 20,
                        child: Text('Q',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w900,fontSize: 80,color: Colors.red,shadows: [Shadow(color: Colors.black12)]),),
                      ),
                      Positioned(
                        left: 70,
                        top: 90,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(question,style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w300,color: Colors.white),),
                        )

                      ),
                    ],
                  ),
                ),
              ),
            ),
        Padding(
          padding: EdgeInsets.all(30),
          child: Material(
            elevation: 30,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              height: 350,
              width: MediaQuery.of(context).size.width-60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(120,0,255, 0),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 20,
                    top: 20,
                    child: Text('A',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w900,fontSize: 80,color: Colors.green,shadows: [Shadow(color: Colors.black12)]),),
                  ),
                  Positioned(
                      left: 70,
                      top: 110,
                      child: Container(
                        height: 230,
                        width: MediaQuery.of(context).size.width-150,
                        child: Text(answer,style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 20),),
                      )
                  ),

                ],
              ),
            ),
          ),
        ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

}