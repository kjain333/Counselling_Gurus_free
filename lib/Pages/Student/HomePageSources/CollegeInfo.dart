


import 'package:counselling_gurus/Pages/Mentor/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
final icons = [Icons.receipt,Icons.attach_money,Icons.location_on,Icons.style];
final title = ["Courses","Fees","Location","Clubs and Activities"];
final string = ["Student Strength","Faculty Student Ratio","Experienced Faculty","Financial Resource Utilization","Teaching Resources","Research Publication","Quality of Publication","Patents","Projects","Research and Professional Practices"];
final data = [18.5,30.0,18.34,26.71,93.55,33.22,36.51,13.0,9.65,92.38];
final tdata = [20.0,30.0,20.0,30.0,100.0,35.0,40.0,15.0,10.0,100.0];
final para = ["The institute is known to provide top faculty across 18 B. Tech. branches","The per semester fee for each course is ₹1,00,000 tuition fee + other charges","The campus is centrally located and well connected bt airways and railway","The college is well known for its technical, cultural and sports clubs"];
List colors = [Colors.redAccent,Colors.greenAccent,Colors.blueAccent,Colors.purpleAccent,Colors.orangeAccent,Colors.deepOrangeAccent,Colors.deepPurpleAccent,Colors.brown,Colors.pinkAccent,Colors.amberAccent];
int ctr=0;
class CollegeInfo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CollegeInfo();
  }
}
class _CollegeInfo extends State<CollegeInfo>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(193, 214, 233, 1),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            SliverToBoxAdapter(
              child: ListTile(
                contentPadding: EdgeInsets.all(20),
                leading: Icon(Icons.school,color: Colors.white,size: 40,),
                title: Text("Indian Institute of Technology, Madras",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
                child:Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:  Text("NIRF Data",style: GoogleFonts.aBeeZee(fontSize: 18,fontWeight: FontWeight.w200,color: Colors.white),),
                )
            ),
            SliverToBoxAdapter(
                child:Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:  Text("NIRF Score: 89.051",style: GoogleFonts.aBeeZee(fontSize: 18,fontWeight: FontWeight.w200,color: Colors.white),),
                )
            ),
            SliverToBoxAdapter(
                child:Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:  Text("NIRF Ranking: 1",style: GoogleFonts.aBeeZee(fontSize: 18,fontWeight: FontWeight.w200,color: Colors.white),),
                )
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: <Widget>[

                  (ctr!=0)?SizedBox(width: 30,child: IconButton(icon: Icon(Icons.arrow_back_ios,size: 20,color: Colors.white70,),onPressed: (){setState(() {
                    ctr--;
                  });},),):SizedBox(width: 30,),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                        child:  Container(
                          height: (MediaQuery.of(context).size.width-120)/3,
                          width: (MediaQuery.of(context).size.width-120)/3,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(193, 214, 233, 1),
                              boxShadow: [BoxShadow(
                                  spreadRadius: -10,
                                  blurRadius: 17,
                                  offset: Offset(0,0),
                                  color: Colors.white
                              ),
                                BoxShadow(
                                    spreadRadius: -2,
                                    blurRadius: 10,
                                    offset: Offset(7,7),
                                    color: Color.fromRGBO(146, 182, 216, 1)
                                )]
                          ),
                          child: CustomPaint(
                              foregroundPainter: PieChart(data[ctr], tdata[ctr], colors[ctr]),
                              child: Padding(
                                padding: EdgeInsets.all(7),
                                child: Center(child: Text(string[ctr],style: GoogleFonts.aBeeZee(fontSize: 13,color: Colors.white),),),
                              )
                          ),
                        ),
                      ),
                      Center(child: Text(data[ctr].toString()+"/"+tdata[ctr].toString(),style: GoogleFonts.aBeeZee(fontSize: 14,color: Colors.white),),)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                        child:  Container(
                          height: (MediaQuery.of(context).size.width-120)/3,
                          width: (MediaQuery.of(context).size.width-120)/3,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(193, 214, 233, 1),
                              boxShadow: [BoxShadow(
                                  spreadRadius: -10,
                                  blurRadius: 17,
                                  offset: Offset(0,0),
                                  color: Colors.white
                              ),
                                BoxShadow(
                                    spreadRadius: -2,
                                    blurRadius: 10,
                                    offset: Offset(7,7),
                                    color: Color.fromRGBO(146, 182, 216, 1)
                                )]
                          ),
                          child: CustomPaint(
                              foregroundPainter: PieChart(data[ctr+1], tdata[ctr+1], colors[ctr+1]),
                              child: Padding(
                                padding: EdgeInsets.all(7),
                                child: Center(child: Text(string[ctr+1],style: GoogleFonts.aBeeZee(fontSize: 13,color: Colors.white),),),
                              )
                          ),
                        ),
                      ),
                      Center(child: Text(data[ctr+1].toString()+"/"+tdata[ctr+1].toString(),style: GoogleFonts.aBeeZee(fontSize: 14,color: Colors.white),),)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                        child:  Container(
                          height: (MediaQuery.of(context).size.width-120)/3,
                          width: (MediaQuery.of(context).size.width-120)/3,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(193, 214, 233, 1),
                              boxShadow: [BoxShadow(
                                  spreadRadius: -10,
                                  blurRadius: 17,
                                  offset: Offset(0,0),
                                  color: Colors.white
                              ),
                                BoxShadow(
                                    spreadRadius: -2,
                                    blurRadius: 10,
                                    offset: Offset(7,7),
                                    color: Color.fromRGBO(146, 182, 216, 1)
                                )]
                          ),
                          child: CustomPaint(
                              foregroundPainter: PieChart(data[ctr+2], tdata[ctr+2], colors[ctr+2]),
                              child: Padding(
                                padding: EdgeInsets.all(7),
                                child: Center(child: Text(string[ctr+2],style: GoogleFonts.aBeeZee(fontSize: 13,color: Colors.white),),),
                              )
                          ),
                        ),
                      ),
                      Center(child: Text(data[ctr+2].toString()+"/"+tdata[ctr+2].toString(),style: GoogleFonts.aBeeZee(fontSize: 14,color: Colors.white),),)
                    ],
                  ),
                  (ctr!=7)?SizedBox(width: 30,child: IconButton(icon: Icon(Icons.arrow_forward_ios,size: 20,color: Colors.white70,),onPressed: (){setState(() {
                    ctr++;
                  });},),):SizedBox(width: 30,),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            SliverToBoxAdapter(
                child:Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Mycard(0, context),
                      SizedBox(
                        width: 10,
                      ),
                      Mycard(1, context)
                    ],
                  ),
                )
            ),
            SliverToBoxAdapter(
                child:Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Mycard(2, context),
                      SizedBox(
                        width: 10,
                      ),
                      Mycard(3, context)
                    ],
                  ),
                )
            )
          ],
        )
    );
  }

}
Widget Mycard(int index,BuildContext context){
  return Container(
    height: 250,
    width: MediaQuery.of(context).size.width/2-20,
    decoration: BoxDecoration(
        color: Color.fromRGBO(193, 214, 233, 1),
        boxShadow: [BoxShadow(
            spreadRadius: -5,
            blurRadius: 17,
            offset: Offset(0,0),
            color: Colors.white
        ),
          BoxShadow(
              spreadRadius: -2,
              blurRadius: 10,
              offset: Offset(7,7),
              color: Color.fromRGBO(146, 182, 216, 1)
          )]
    ),
    child: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Icon(icons[index],color: Colors.white,size: 40,),
          SizedBox(
            height: 10,
          ),
          Text(title[index],style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 20),),
          Text(para[index],style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 16),),
        ],
      ),
    ),
  );
}

class PieChart extends CustomPainter {
  double val;
  double total;
  var color;
  PieChart(this.val,this.total,this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final double width=5.0;
    Offset center = Offset(size.width/2,size.height/2);
    double radius = size.width/2;
    var paint = Paint()
      ..style=PaintingStyle.stroke
      ..strokeWidth = width;
    double startradian = 0;
    double sweepradian = (val/total)*2*3.14;
    paint.color=color;
    canvas.drawArc(Rect.fromCircle(center: center,radius: radius), startradian, sweepradian, false, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}
//Code for Donut bar
/*Padding(
padding: EdgeInsets.only(left: MediaQuery.of(context).size.width-240),
child: Container(
height: 200,
width: 200,
decoration: BoxDecoration(
shape: BoxShape.circle,
color: Color.fromRGBO(193, 214, 233, 1),
boxShadow: [BoxShadow(
spreadRadius: -10,
blurRadius: 17,
offset: Offset(0,0),
color: Colors.white
),
BoxShadow(
spreadRadius: -2,
blurRadius: 10,
offset: Offset(7,7),
color: Color.fromRGBO(146, 182, 216, 1)
)]
),
child: Stack(
children: <Widget>[

SizedBox(
width: 150,
child: CustomPaint(
child: Center(),
foregroundPainter: PieChart(),
),
),
Center(
child: Container(
height: 100,
width: 100,
decoration: BoxDecoration(
shape: BoxShape.circle
),
child:Center(
child:  Column(
children: <Widget>[
SizedBox(
height: 15,
),
Text("NIRF Score:",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 12),),
Text("83.45",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 12),),
Text("NIRF Ranking:",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 12),),
Text("1",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 12),),
],
)
)
)
),
],
),
),
),


*/