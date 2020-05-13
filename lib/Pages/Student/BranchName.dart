import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BranchName extends StatefulWidget{

  BranchName(this.string);
  List<String> string;

  @override
  _BranchNameState createState() => _BranchNameState();
}

class _BranchNameState extends State<BranchName> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo,Colors.lightBlueAccent]
            )
          ),
        ),
        ListView.builder(
          itemCount: widget.string.length,
          itemBuilder: (BuildContext context,int index){
            if(index%2==0)
              return Padding(
                padding: EdgeInsets.only(right: 200),
                child: GestureDetector(
                  onTap: (){return null;},
                   child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Colors.deepOrange,Colors.orangeAccent],
                        )
                    ),
                    child:Center(child: Text(widget.string[index],style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white),),)
                ),
                )
              );
            else
              return Padding(
                padding: EdgeInsets.only(left: 200),
                child: GestureDetector(
                  onTap: (){return null;},
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Colors.purple,Colors.pinkAccent],
                        )
                    ),
                    child:Center(child: Text(widget.string[index],style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white),),)
                ),
                )
              );
          },
        )
        ]
    );
  }
}