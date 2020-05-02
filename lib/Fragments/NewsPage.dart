import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context,index){
        if(index==0)
          return  ListTile(
            title: Text("HOT NEWS",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.lightBlue),),
          );
        else
          return InkWell(
              splashColor: Colors.white,
              onTap: (){
                print(index);
              },
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Material(
                    elevation: 20,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(

                      children: <Widget>[
                        Container(

                          height: 120,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                              image: DecorationImage(
                                  image: new AssetImage('assets/images/background.png'),
                                  fit: BoxFit.fill
                              )
                          ),
                        ),
                        ListTile(
                            title: Text("NEWS HEADING",style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                            subtitle: Text("DATE\nThis is news Sub-heading",style: GoogleFonts.aBeeZee(fontSize: 10,color: Colors.black),),
                            trailing: IconButton(
                                icon: new Icon(Icons.share),
                                onPressed: (){ Share.share('NEWS HEADING\nDownload Our app',subject: 'NEWS HEADING');}
                            )

                        ),

                      ],
                    )
                ),
              )
          );
      },
    );
    /*Scaffold(
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text("HOT NEWS",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.lightBlue),),
          ),

          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(null, BlendMode.srcOut),
                image: AssetImage('images/background.png'),
                fit: BoxFit.fitWidth,

              ),
            ),
            child: Center(
              child: ListTile(
                title:Center(
                  child: Text("\n\nNEWS\n\n",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                )
              ),
            ),
          ),
        ],
      ),
    );*/
  }
}
