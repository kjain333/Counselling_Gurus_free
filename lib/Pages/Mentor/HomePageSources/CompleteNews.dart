import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class CompleteNews extends StatelessWidget{
  CompleteNews(this.heading);
  final String heading;
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: SingleChildScrollView(
          child: ColumnSuper(
            innerDistance: -50,
            children: <Widget>[
              Container(

                height: 300,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: new AssetImage('assets/images/background.png'),
                      fit: BoxFit.fill,
                    )
                ),
              ),
               Material(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))),
                  elevation: 20,
                  color: Colors.blue,
                  child: Container(
                    height: 700,
                    width: 411,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        ListTile(
                          title: Center(
                           child: Text(heading,style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                          ),
                          subtitle: Text("\nDATE and TIME\n",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 13),),
                            trailing: Wrap(

                              children: <Widget>[
                                IconButton(
                                    icon: new Icon(Icons.content_copy,color: Colors.amber,),
                                    onPressed: (){
                                      Clipboard.setData(ClipboardData(text: 'NEWS HEADING\nThis is news Sub-Heading'));
                                      final snackBar = SnackBar(content: Text("Content Copied to Clipboard"));
                                      Scaffold.of(context).showSnackBar(snackBar);
                                    }
                                ),
                                IconButton(
                                    icon: new Icon(Icons.share,color: Colors.amber,),
                                    onPressed: (){
                                      Share.share('NEWS HEADING\nDOWNLOAD OUR APP',subject: 'NEWS HEADING');
                                    }
                                )

                              ],
                            )
                        ),
                        SizedBox(
                          child: Padding(
                            padding: EdgeInsets.only(left: 50,right: 50),
                            child: Text("This is where all the content will come.This should take more than 12-13 lines.",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 13),),
                        )
                        ),
                        InkWell(
                          child:Padding(
                            padding: EdgeInsets.only(left: 50,right: 50),
                            child: Text('https://www.youtube.com',style: GoogleFonts.aBeeZee(color: Colors.amber,fontWeight: FontWeight.w300,fontSize: 13),),
                          ),
                          onTap: () => launch('https://www.youtube.com'),
                        )
                      ],
                    ),
                    //color: Colors.blue,
                  ),
                ),

            ],
          ),
        )
    );
  }
}
