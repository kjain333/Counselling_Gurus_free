import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollegeName extends StatelessWidget{
  CollegeName(this.names);
  final List<String> names;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: names.length+1,
          itemBuilder: (BuildContext context,int index){
            if(index==0)
              return SizedBox(
                height: 20,
              );
            else if(index==1)
              return  Column(
                children: <Widget>[
                  Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  ListTile(
                    title: Text(names[index-1],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 15),),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey,
                  )
                ],
              );
            else
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(names[index-1],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 15),),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: (){
                    return null;
                  },
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                )
              ],
            );
          }
      )
    );
  }

}