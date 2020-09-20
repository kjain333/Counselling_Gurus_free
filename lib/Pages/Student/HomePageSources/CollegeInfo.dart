
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/io_client.dart';
final title = ["Sanctioned Approved Intake","Total Actual Student Strength","Female to Male ratio","Students Graduated","Students Placed","Media Salary","No. of students selected for higher study","Capital Expenditure","Operational Expenditure"];
final string = ["Student Strength","Faculty Student Ratio","Research Publication","Patents published","Placement and higher study","Student Diversity","Economically Challenged Students","Specially Able"];
List<double> data = new List(8);
final tdata = [20.0,30.0,35.0,15.0,40.0,30.0,20.0,20.0];
final myindex = [0,1,2,3,4,5,6,7,8];
List<String> adddata = new List(9);
List colors = [Colors.redAccent,Colors.greenAccent,Colors.blueAccent,Colors.purpleAccent,Colors.orangeAccent,Colors.deepOrangeAccent,Colors.deepPurpleAccent,Colors.brown,Colors.pinkAccent,Colors.amberAccent];
int ctr=0;
class CollegeInfo extends StatefulWidget{
  String id;
  CollegeInfo(this.id);
  @override
  State<StatefulWidget> createState() {
    return _CollegeInfo(id);
  }
}
bool status1=false,status2=false;
String name='',location='',totalscore='',grade='',rank='';
class _CollegeInfo extends State<CollegeInfo>{
  String id;
  _CollegeInfo(this.id);
  Future<void> getInfo() async{
    final ioc = new HttpClient();
    ioc.badCertificateCallback = (X509Certificate cert,String host,int port)=>true;
    final http = new IOClient(ioc);
    http.get("https://counsellinggurus.in:3001/s/scores/"+id).then((response){
      var respdata = jsonDecode(response.body);
      for(int i=0;i<8;i++)
        data[i]=double.parse(respdata[0][i+5]);
      name = respdata[0][1];
      location = respdata[0][2];
      totalscore = respdata[0][3];
      grade = respdata[0][4];
      rank=respdata[0][0];
      setState(() {
        status1=true;
      });
    }).catchError(throw Exception('failed to load'));
  }
  Future<void> getInfo1() async{
    final ioc = new HttpClient();
    ioc.badCertificateCallback = (X509Certificate cert,String host,int port)=>true;
    final http = new IOClient(ioc);
    http.get("https://counsellinggurus.in:3001/s/stats/"+id).then((response){
      var respdata = jsonDecode(response.body);
      for(int i=0;i<9;i++)
        adddata[i]=respdata[0][i+3];
      setState(() {
        status2=true;
      });
    }).catchError(throw Exception('failed to load'));
  }
  @override
  void initState() {
    status1=false;
    status2=false;
    getInfo();
    getInfo1();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return (status1==false||status2==false)?Container(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.height,
      child: Center(
        child: Container(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(),
        ),
      ),
    ):Scaffold(
        backgroundColor: Colors.white,
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
                leading: Icon(Icons.school,color: Colors.black,size: 40,),
                title: Text(name,style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
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
                  child:  Text("NIRF Data",style: GoogleFonts.aBeeZee(fontSize: 18,fontWeight: FontWeight.w200,color: Colors.black),),
                )
            ),
            SliverToBoxAdapter(
                child:Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:  Text("NIRF Score: "+totalscore,style: GoogleFonts.aBeeZee(fontSize: 18,fontWeight: FontWeight.w200,color: Colors.black),),
                )
            ),
            SliverToBoxAdapter(
                child:Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:  Text("NIRF Ranking: "+rank,style: GoogleFonts.aBeeZee(fontSize: 18,fontWeight: FontWeight.w200,color: Colors.black),),
                )
            ),
            SliverToBoxAdapter(
                child:Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:  Text("Institute Grade: "+grade,style: GoogleFonts.aBeeZee(fontSize: 18,fontWeight: FontWeight.w200,color: Colors.black),),
                )
            ),
            SliverToBoxAdapter(
                child:Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:  Text("Location: "+location,style: GoogleFonts.aBeeZee(fontSize: 18,fontWeight: FontWeight.w200,color: Colors.black),),
                )
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 5,bottom: 15),
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                child: Text("NIRF Scores",style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w300),),
                padding: EdgeInsets.only(left: 20),
              )
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: <Widget>[

                  (ctr!=0)?SizedBox(width: 30,child: IconButton(icon: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),onPressed: (){setState(() {
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
                              color: Colors.white,
                              boxShadow: [BoxShadow(
                                  spreadRadius: -10,
                                  blurRadius: 17,
                                  offset: Offset(0,0),
                                  color: Colors.grey
                              ),
                                BoxShadow(
                                    spreadRadius: -2,
                                    blurRadius: 10,
                                    offset: Offset(7,7),
                                    color: Colors.black45
                                )]
                          ),
                          child: CustomPaint(
                              foregroundPainter: PieChart(data[ctr], tdata[ctr], colors[ctr]),
                              child: Padding(
                                padding: EdgeInsets.all(7),
                                child: Center(child: Text(string[ctr],style: GoogleFonts.aBeeZee(fontSize: 13,color: Colors.black),),),
                              )
                          ),
                        ),
                      ),
                      Center(child: Text(data[ctr].toString()+"/"+tdata[ctr].toString(),style: GoogleFonts.aBeeZee(fontSize: 14,color: Colors.black),),)
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
                              color: Colors.white,
                              boxShadow: [BoxShadow(
                                  spreadRadius: -10,
                                  blurRadius: 17,
                                  offset: Offset(0,0),
                                  color: Colors.grey
                              ),
                                BoxShadow(
                                    spreadRadius: -2,
                                    blurRadius: 10,
                                    offset: Offset(7,7),
                                    color: Colors.black45
                                )]
                          ),
                          child: CustomPaint(
                              foregroundPainter: PieChart(data[ctr+1], tdata[ctr+1], colors[ctr+1]),
                              child: Padding(
                                padding: EdgeInsets.all(7),
                                child: Center(child: Text(string[ctr+1],style: GoogleFonts.aBeeZee(fontSize: 13,color: Colors.black),),),
                              )
                          ),
                        ),
                      ),
                      Center(child: Text(data[ctr+1].toString()+"/"+tdata[ctr+1].toString(),style: GoogleFonts.aBeeZee(fontSize: 14,color: Colors.black),),)
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
                              color: Colors.white,
                              boxShadow: [BoxShadow(
                                  spreadRadius: -10,
                                  blurRadius: 17,
                                  offset: Offset(0,0),
                                  color: Colors.grey
                              ),
                                BoxShadow(
                                    spreadRadius: -2,
                                    blurRadius: 10,
                                    offset: Offset(7,7),
                                    color: Colors.black45
                                )]
                          ),
                          child: CustomPaint(
                              foregroundPainter: PieChart(data[ctr+2], tdata[ctr+2], colors[ctr+2]),
                              child: Padding(
                                padding: EdgeInsets.all(7),
                                child: Center(child: Text(string[ctr+2],style: GoogleFonts.aBeeZee(fontSize: 13,color: Colors.black),),),
                              )
                          ),
                        ),
                      ),
                      Center(child: Text(data[ctr+2].toString()+"/"+tdata[ctr+2].toString(),style: GoogleFonts.aBeeZee(fontSize: 14,color: Colors.black),),)
                    ],
                  ),
                  (ctr!=5)?SizedBox(width: 30,child: IconButton(icon: Icon(Icons.arrow_forward_ios,size: 20,color: Colors.black,),onPressed: (){setState(() {
                    ctr++;
                  });},),):SizedBox(width: 30,),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 15,bottom: 5),
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Text('STAT',style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w300),),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text('VALUE',style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w300),),
                    numeric: false,
                  ),
                ],
                rows: myindex.map((e) => DataRow(
                    cells: [
                      DataCell(
                          Text(title[e],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w200,fontSize: 14),)
                      ),
                      DataCell(
                          Text(adddata[e],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w200,fontSize: 14),)
                      )
                    ]
                )).toList(),
              ),
            )
          ],
        )
    );
  }

}
Widget Mycard(int index,BuildContext context){
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: ListTile(
        leading: Text((index+1).toString()+') ',style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w200,color: Colors.black),),
        title: Text(title[index]+': '+adddata[index],style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w200,color: Colors.black),),
      )
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