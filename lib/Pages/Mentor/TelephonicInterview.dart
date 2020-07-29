import 'package:counselling_gurus/Pages/Student/Medical/MedicalBranchblog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:counselling_gurus/Resources/Colors.dart' as color;

import 'StartingPages/LogInMentor.dart';

class TelephonicInterview extends StatefulWidget{
  @override
  _TelephonicInterview createState() => _TelephonicInterview();

}
List<int> days = [31,31,30,31,30,31,31,28,31,30,31,30];
List<Color> colors = [Colors.transparent,Colors.amber];

List<String> time = ["10:00 AM","10:30 AM","11:00 AM","11:30 AM","12:00 PM","12:30 PM","1:00 PM","4:30 PM","5:00 PM","5:30 PM","6:00 PM","6:30 PM"];
List<int> colorindex = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
List<int> colorindex1 = [0,0,0,0,0,0,0,0,0,0,0,0];
List<Color> color2 = [color.yellow7,color.yellow];
List<Color> color1 = [Colors.white,color.dark2];
List<String> months = ["July, 2020","August, 2020","September, 2020","October, 2020","November, 2020","December, 2020","January, 2021","February, 2021","March, 2021","April, 2021","May, 2021","June, 2021"];
class _TelephonicInterview extends State<TelephonicInterview>{
  int i=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color.dark2,color.dark1]
                )
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text('TELEPHONIC INTERVIEW',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 20,color: Colors.white),),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Select Month',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 20,color: Colors.white),),
                  Padding(
                    padding: EdgeInsets.only(left: 20,right: 20,top: 0,bottom: 10),
                    child: ListTile(
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back_ios,color: Colors.white70,size: 12,),
                        onPressed: (){
                          setState(() {
                            for(int j=0;j<31;j++)
                              colorindex[j]=0;
                            i--;
                          });
                        },
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_forward_ios,color: Colors.white70,size: 12,),
                        onPressed: (){
                          setState(() {
                            for(int j=0;j<31;j++)
                              colorindex[j]=0;
                            i++;
                          });
                        },
                      ),
                      title: Center(
                        child: Text(months[i%12],style: GoogleFonts.aBeeZee(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200),),
                      ),
                    ),
                  ),
                  Text('Select Date',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 20,color: Colors.white),),
                  Container(
                    height: 60,
                    child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: days[i%12],
                    itemBuilder: (context,index){
                      return Padding(
                        padding: EdgeInsets.all(5),
                        child: GestureDetector(
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colors[colorindex[index]],
                            ),
                            child: Center(child: Text((index+1).toString(),style: GoogleFonts.aBeeZee(fontSize: 15,color: Colors.white),)),
                          ),
                          onTap: (){
                            setState(() {
                              for(int j=0;j<31;j++)
                                colorindex[j]=0;
                              colorindex[index]=1;
                            });
                          },
                        )
                      );
                    },
                  ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Available Slots',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 20,color: color.dark2),),
            Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 2),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: time.length,
                itemBuilder: (context,index) {
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        for(int j=0;j<12;j++)
                          colorindex1[j]=0;
                        colorindex1[index]=1;
                      });
                    },
                    child: Padding(
                       padding: EdgeInsets.all(10),
                       child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: color2[colorindex1[index]],
                        ),

                        child: Center(
                          child: Text(time[index],style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w200,color: color1[1-colorindex1[index]]),),
                        ),
                      ),
                    )
                  );
                }
              ),
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: (){
                Future.delayed(Duration(seconds: 10),(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LogInMentor(),),);

                });
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return StatefulBuilder(
                        builder: (context,setState){
                          return Scaffold(
                              backgroundColor: Colors.transparent,
                              body: Center(
                                child: Container(
                                  width: 250,
                                  color: Colors.deepOrangeAccent,
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Text("Your Telephonic Interview has been fixed. The Admin will contact you on chosen time and date after which you will be given Log-in id and Password to sign in. Thank You for being patient.",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w300),),
                                  ),
                                ),
                              )
                          );
                        },
                      );
                    });
                },
              color: Colors.pinkAccent,
              textColor: Colors.white,
              child:Padding(
                padding: EdgeInsets.all(5),
                child: Text('Book Appointment',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w500,fontSize: 15),),
              ),
            )
          ],
        ),
      ),
    );
  }

}