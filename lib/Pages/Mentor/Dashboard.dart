import 'package:counselling_gurus/Pages/Mentor/DashboardSources/AboutMentee.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'DashboardSources/Progress.dart';
import 'DashboardSources/Reminders.dart';
import 'DownloadFile.dart';
List<Color> background1 = [Colors.indigoAccent,Colors.deepOrangeAccent,Colors.greenAccent,Colors.deepPurpleAccent,Colors.blueAccent,Colors.red,Colors.brown,Colors.black,Colors.blueGrey];
List<Color> background=[Colors.lightBlueAccent,Colors.orangeAccent,Colors.lightGreenAccent,Colors.purpleAccent,Colors.greenAccent,Colors.pinkAccent,Colors.amberAccent,Colors.grey,Colors.blueAccent];
final heading = ["Past Meeting Reports","Documents Shared","Timeline Decided","About The Mentee","Choice Filling Data","Campus Ambassador","Interaction with Parents","Reminder and Notes","Progress List"];
final icon = [Icons.receipt,Icons.font_download,Icons.timeline,Icons.account_circle,Icons.link,Icons.accessibility,Icons.person_add,Icons.pages,Icons.assignment_turned_in];
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
                              "This is where we will display information about each tag in brief aout 2-3 lines. it is presently filled with random text to see how the design will look when all the data comes.",
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
                            "This is where we will display information about each tag in brief aout 2-3 lines. it is presently filled with random text to see how the design will look when all the data comes.",
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
                              "This is where we will display information about each tag in brief aout 2-3 lines. it is presently filled with random text to see how the design will look when all the data comes.",
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
                                  if(index==1)
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DownloadFile()));
                                  if(index==3)
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutMentee()));
                                  if(index==7)
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Reminders()));
                                  if(index==8)
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Progress()));
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

