

import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Resources/Colors.dart' as color;
import 'CollegeName.dart';
List<Color> colorList = [
  color.yellow,
  color.orange,
  color.orange10,
  color.orange3,
  color.yellow6,
  color.pink4,
  color.purple,
  color.blue7
];
Set<int> a ={};
final heading = ['IIT','NIT','IIIT','PC','State'];
final colleges = ['Indian Institute of Technology','National Institute of Technology','Indian Institute of Information Technology','Private colleges','State Colleges'];
final iit = ['IIT Jammu','IIT Mandi','IIT Ropar','IIT Roorkee','IIT Delhi','IIT Kanpur','IIT Varanasi','IIT Jodhpur','IIT Patna','IIT Guwahati','ISM Dhanbad','IIT Kharagpur','IIT Gandhinagar','IIT Indore','IIT Bhilai','IIT Bhubaneshwar','IIT Hyderabad','IIT Bombay','IIT Panjim','IIT Dharwad','IIT Tirupati','IIT Madras','IIT Pallakad'];
final nit = ['NIT Tiruchirapalli','NIT Rourkela','NIT Surathkal','NIT Warangal','Motil Lal Nehru National Institute of Technology','Visvesvaraya NIT','NIT Calicut','NIT Silchar','NIT Durgapur','NIT Hamirpur','NIT Kurushetra','Maulana Azad NIT','Malaviya National Institute of Technology','NIT Manipur','NIT Meghalaya','NIT Agartala','NIT Tadepalligudem','NIT Yupia','NIT Raipur','NIT Delhi','Dr. B.R. Ambedkar NIT Jalandhar','NIT Goa','NIT Jamshedpur','NIT Mizoram','NIT Dimapur','NIT Patna','NIT Sikkim','NIT Puducherry','NIT Srinagar','NIT Uttarakhand'];
final iiit = ['IIIT Gwalior','IIIT Kanchipuram','IIIT Guwahati','IIIT Allahabad','IIIT Kottayam','IIIT Jabalpur','IIIT Kota','IIIT Chittoor','IIIT Vadodara','IIIT Una','IIIT Kalyani','IIIT Kilohrad','IIIT Sonepat','IIIT Srirangam','IIIT Lucknow','IIIT Manipur','IIIT Dharwad','IIIT Ranchi','IIIT Kurnool','IIIT Nagpur','IIIT Pune','IIIT Bhagalpur','IIIT Bhopal','IIIT Surat'];
final private = ['BITS Pilani','BITS Goa','BITS Hyderabad','VIT Vellore','VIT Chennai'];
final state = ['State 1','State 2','State 3'];
final String paragraph = "This contains few lines about each type of college category. Replace this with your own type of string list";
class Collegeblog extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    a.clear();
    var size = MediaQuery.of(context).size;
    final double itemHeight = 220+(paragraph.length/55)*15;
    final double itemWidth = size.width / 1;
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: (itemWidth / itemHeight),),
                children: <Widget>[
                    CollegeCard(0,context),
                    CollegeCard(1,context),
                    CollegeCard(2,context),
                    CollegeCard(3,context),
                    CollegeCard(4, context),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}
Widget CollegeCard(index,context)
{
  int random;
  random = Random().nextInt(8);
  if(a.contains(random)&&a.length<=8)
  {
    while(a.contains(random))
    {
      random=Random().nextInt(8);
    }
  }
  a.add(random);
  return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Card(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      //side: BorderSide(width: 1, color: Colors.black),
      ),
      color: Colors.white,
      elevation: 10,
      child: Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: colorList[random]),
      child: Column(
      children: <Widget>[
      SizedBox(
      height: 20,
      ),
      Center(
      child: Text(heading[index],style: TextStyle(fontFamily: 'icons',fontSize: 30,color: Colors.white,fontWeight: FontWeight.w900),),
      ),
      ListTile(
          title: Center(
          child: Text(
                  colleges[index],
                  style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white),
          ),
          ),
          subtitle: Text(
                    paragraph,
                     style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                      color: Colors.white),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: RaisedButton(
            //elevation: 20,
            color: Colors.purpleAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('MORE DETAILS',style: GoogleFonts.aBeeZee(fontSize: 10,color: Colors.white),),
            onPressed: (){
              if(index==0)
                Navigator.push(context, MaterialPageRoute(builder: (context) => CollegeName(iit)));
              else if(index==1)
                Navigator.push(context, MaterialPageRoute(builder: (context) => CollegeName(nit)));
              else if(index==2)
                Navigator.push(context, MaterialPageRoute(builder: (context) => CollegeName(iiit)));
              else if(index==3)
                Navigator.push(context, MaterialPageRoute(builder: (context) => CollegeName(private)));
              else if(index==4)
                Navigator.push(context, MaterialPageRoute(builder: (context) => CollegeName(state)));
            },
          ),
        ),
        SizedBox(height: 10,),
      ],
      ),
  )));
  /*return Padding(
    padding: EdgeInsets.all(20),
    child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.purple,Colors.pinkAccent],
            )
        ),
        child: Stack(
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.all(30),
              title:Text(colleges[index],style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.white),),
              subtitle: Text('Here we can have few general lines about each one of them',style: GoogleFonts.aBeeZee(fontSize: 10,fontWeight: FontWeight.w100,color: Colors.white),),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(20),
                child:  RaisedButton(
                  elevation: 20,
                  color: Colors.amberAccent,
                  child: Text('MORE DETAILS',style: GoogleFonts.aBeeZee(fontSize: 10,color: Colors.blue),),
                  onPressed: (){
                    if(index==0)
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CollegeName(iit)));
                    else if(index==1)
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CollegeName(nit)));
                    else if(index==2)
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CollegeName(iiit)));
                    else if(index==3)
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CollegeName(private)));
                  },
                ),
              )
            )
          ],
        )

    ),
  );*/
}