import 'package:counselling_gurus/Pages/Mentor/HomePageSources/PercentileCalculatorMentor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
final icons=[Icons.check_circle,Icons.access_time,Icons.clear];
final color=[Colors.greenAccent,Colors.orangeAccent,Colors.redAccent];
final String paragraph = "Here we will have few lines describing each feature ";
final tasks = ["Introduction with Mentor","Counselling Procedure Explained","Timeline Prepared","Documents Verified","Branches Explained","Brahmastra Given","Initial Choice Filling Demo","Choice Locking","College Offered","Physical Verification","Admission Support","Feedback Generated","All Tasks Completed!"];
int ctr=0;
final explain = ["Introduce yourself to the student assigned","Explain the Counselling Procedure as instructed","Prepare a Comfortable timeline","Verify Documents of the student","Explain him prospects of each branch","Introduce him to the Brahmastra and what students miss","Ask him to join the initial Counselling Demo","Help him with choice locking and clarify all doubts","Help him with college offered according CG rankings","Physically Verify all his documents including choice filling","Provide necessary contact info to student during admission","Ask him to generate feedback of services he received","Thank You, all tasks completed."];
final indexes = [2,2,2,2,2,2,2,2,2,2,2,2];
class Progress extends StatefulWidget{
  _Progress createState()=> _Progress();

}
class _Progress extends State<Progress>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.undo,color: Colors.white,),
        onPressed: (){
          setState(() {
            if(ctr==12)
              ctr--;
            else
              {
                indexes[ctr]=2;
                if(ctr!=0)
                  ctr--;
              }

          });
        },
      ),
      body: Stack(
        children: <Widget>[

          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade200,Colors.purple.shade400,Colors.purple.shade700],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
          ),
          Positioned(
            top: 100,
            left: 60,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 50,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white70,
              ),
            ),
          ),
          Positioned(
            top: 85,
            left:45,
            child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white10,
              ),
            ),
          ),
          Positioned(
            left: 87.5,
            top: 160,
            child: Container(
              width: 5,
              height: MediaQuery.of(context).size.height-250,
              color: Colors.white70,
            ),
          ),
          Positioned(
            left: 85,
            bottom: 81,
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white70,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 170,
            child: Container(
              width: MediaQuery.of(context).size.width-170,
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width-270,
                    child: Text(explain[ctr],style: GoogleFonts.aBeeZee(fontSize: 15,color: Colors.white,),),
                  ),
                  Wrap(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.check,color: Colors.greenAccent,size: 18,),
                        onPressed: (){
                          setState(() {
                            if(ctr!=12)
                            {
                              indexes[ctr]=1;
                              ctr++;
                            }
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.clear,color: Colors.redAccent,size: 18,),
                        onPressed: (){
                          setState(() {
                            if(ctr!=12)
                            {
                              indexes[ctr]=3;
                              ctr++;
                            }
                          });
                        },
                      ),
                    ],
                  )
                ],
              )
            ),
          ),
          Positioned(
            top: 200,
            left: 62.5,
            child: Container(
              height: MediaQuery.of(context).size.height-300,
              width: MediaQuery.of(context).size.width-100,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate:
                    SliverChildBuilderDelegate((BuildContext context, int index) {
                      return myCard(index,context);
                    }, childCount: tasks.length-1),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
Widget myCard(int index,BuildContext context)
{
  return Container(
      width: MediaQuery.of(context).size.width-100,
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Icon(icons[indexes[index]-1],color: color[indexes[index]-1],),
        ),
        title: Text(tasks[index],style: GoogleFonts.aBeeZee(fontWeight: (ctr==index)?FontWeight.bold:FontWeight.w200,fontSize: (ctr==index)?18:15,color: Colors.white),),
      ),
  );
}