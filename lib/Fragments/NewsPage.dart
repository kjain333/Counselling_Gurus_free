import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}
int _timerCounter=0;
ScrollController controller = ScrollController();
void _incrementTimerCounter(Timer t)
{
  _timerCounter++;
  if(_timerCounter==6)
    _timerCounter=0;
  controller.jumpTo(_timerCounter.toDouble()*410);

}
final string =['assets/images/background.png','assets/images/background2.png'];
class _NewsPageState extends State<NewsPage> {


  Timer _timer = new Timer.periodic(new Duration(milliseconds: 5000), _incrementTimerCounter);

  @override
  Widget build(BuildContext context) {
    _timerCounter=0;
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context,index){
        if(index==0)
          return ListTile(
            title: Text("HOT NEWS",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.lightBlue),),
          );
        if(index==1) {
          return SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: controller,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(15),
                  child: Material(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              image: new AssetImage(string[index%2]),
                              fit: BoxFit.fill,
                              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.hue)
                          )
                      ),
                      width: 380,
                      child: ListTile(
                        title: Center(
                          child: Text('TRENDING NEWS HEADING '+index.toString(),style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white) ,),

                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
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
                            trailing: Wrap(

                              children: <Widget>[
                                IconButton(
                                    icon: new Icon(Icons.content_copy),
                                    onPressed: (){
                                      Clipboard.setData(ClipboardData(text: 'NEWS HEADING\nThis is news Sub-Heading'));
                                      final snackBar = SnackBar(content: Text("Content Copied to Clipboard"));
                                      Scaffold.of(context).showSnackBar(snackBar);
                                    }
                                ),
                                IconButton(
                                    icon: new Icon(Icons.share),
                                    onPressed: (){
                                      Share.share('NEWS HEADING\nDOWNLOAD OUR APP',subject: 'NEWS HEADING');
                                    }
                                )

                              ],
                            )

                        ),

                      ],
                    )
                ),
              )
          );
      },
    );

  }
}
