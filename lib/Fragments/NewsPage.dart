import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context,index){
        if(index==0)
          return  ListTile(
            title: Text("HOT NEWS",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.lightBlue),),
          );
        else
          return  Column(

            children: <Widget>[
              Container(

                height: 200,
                width: 350,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        image: new AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill
                    )
                ),
              ),
              ListTile(

                contentPadding: EdgeInsets.only(left:30,right:30),
                title: Text("NEWS HEADING",style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                subtitle: Text("This is news Sub-heading",style: GoogleFonts.aBeeZee(fontSize: 10,color: Colors.black),),
                trailing: Text("\n\nDATE",style: GoogleFonts.aBeeZee(fontSize: 10,color: Colors.black),),
                onTap: (){
                  return null;
                },
              ),
            ],
          );
      },
    );
  }
}
