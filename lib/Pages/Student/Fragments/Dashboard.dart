
import 'package:counselling_gurus/Pages/Student/HomePageSources/Collegeblog.dart';
import 'package:counselling_gurus/Pages/Student/HomePageSources/VideoScreen.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'NewsPage.dart';
List<Color> background1 = [Colors.indigoAccent,Colors.deepOrangeAccent,Colors.greenAccent,Colors.deepPurpleAccent,Colors.blueAccent,Colors.red,Colors.brown,Colors.black,Colors.blueGrey];
List<Color> background=[Colors.lightBlueAccent,Colors.orangeAccent,Colors.lightGreenAccent,Colors.purpleAccent,Colors.greenAccent,Colors.pinkAccent,Colors.amberAccent,Colors.grey,Colors.blueAccent];
final heading = ["Latest News","Important Blogs","Top Videos"];
final paragraph = ["Stay Updated! We at Counselling Gurus make sure we are upto date with all the deadlines and ensure you too are updated about them","Interesting blogs to educate you about different exams and counsellings. Blogs from top IITians and educationalists just for you.","Get Complete college experience as you relax at your home with Counselling Gurus YouTube Channel where we have carefully designed top quality content to help you improve."];
final icon = [Icons.receipt,Icons.font_download,Icons.video_library];
class Dashboard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: buildDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          SliverList(
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return gridCard(index,context);
            }, childCount: heading.length),
          )
        ],
      ),
    );
  }
  Widget gridCard(index,context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: FlipCard(
            direction: FlipDirection.VERTICAL,
            front: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                //side: BorderSide(width: 1, color: Colors.black),
              ),
              color: background1[index],
              elevation: 10,
              child: Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: CustomClipperPath(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      //  height: keys[index].currentContext.size.height,
                      //  height: 220+This is where we will display information about each tag in brief aout 2-3 lines.[index%2].length/55*13*410.5/MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: background[index],
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Icon(
                            icon[index],
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: Center(
                              child: Text(
                                heading[index],
                                style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                            subtitle: Text(
                              paragraph[index],
                              //'Here we will put some lines of predefined text',
                              style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    //  height: 220+This is where we will display information about each tag in brief aout 2-3 lines.[index%2].length/55*13*410.5/MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.transparent,
                    ),
                    //color: colorList[random]),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          icon[index],
                          size: 40,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          title: Center(
                            child: Text(
                              heading[index],
                              style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                          subtitle: Text(
                           paragraph[index],
                            //'Here we will put some lines of predefined text',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.w300,
                                fontSize: 13,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
            back: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                //side: BorderSide(width: 1, color: Colors.black),
              ),
              color: background1[index],
              elevation: 10,
              child: Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: CustomClipperPath(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      //  height: 220+This is where we will display information about each tag in brief aout 2-3 lines.[index%2].length/55*13*410.5/MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: background[index],
                      ),
                      //color: colorList[random]),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Icon(
                            icon[index],
                            size: 40,
                            color: Colors.transparent,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: Center(
                              child: Text(
                                heading[index],
                                style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.transparent),
                              ),
                            ),
                            subtitle: Text(
                              paragraph[index],
                              //'Here we will put some lines of predefined text',
                              style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                  color: Colors.transparent),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: keys[index].currentContext.size.height,
                    //height: 220+This is where we will display information about each tag in brief aout 2-3 lines.[index%2].length/55*13*410.5/MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color:Colors.transparent,
                    ),
                    //color: colorList[Random().nextInt(8)]),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "More Details",
                          style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ListTile(
                          title: Center(
                            child: RaisedButton(
                              //elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: Colors.white,
                                child: Text(
                                  "More Details",
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                                onPressed: () {
                                  if(index==0)
                                    {
                                      return null;
                                    }
                                  else if(index==1)
                                  {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsPage()));
                                  }
                                  else if(index==2)
                                  {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoScreen()));
                                  }
                                }),
                          ),
                        ),
                      ],
                    ),
                  )
                ],),
            )));
  }
}
class CustomClipperPath extends CustomClipper<Path>{

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0,0.0);
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(size.width/3, size.height/1.3, size.width/3, size.height/2);
    path.quadraticBezierTo(size.width/3, size.height/4, size.width/1.5, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height/2);
    path.quadraticBezierTo(size.width/2, size.height/2, size.width/2, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }
}

