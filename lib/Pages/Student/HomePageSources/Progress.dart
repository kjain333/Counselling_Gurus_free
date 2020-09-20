import 'dart:async';

import 'package:counselling_gurus/Pages/Student/PdfViewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
final icons=[Icons.check_circle,Icons.access_time,Icons.clear];
final color=[Colors.greenAccent,Colors.orangeAccent,Colors.redAccent];
final String paragraph = "Here we will have few lines describing each feature ";
final tasks = ["Branch Research","College Research","Documents Checked","Choice Filling Done","Mock Round 1","Change in choices","Mock Round 2","Change in choices","Counselling Fees Paid","Physical Verification","Freeze,float and Slide","Admission to College","All Tasks Completed!"];
int ctr;
List<int> indexes = new List(12);
final explain = ["Grab a look at various branches and decide what favours you the most","Research about colleges based on NIRF data","Verify if you have all documents as required by JOSAA during Counselling","Fill suitable choices before the Mock rounds","Carefully understand where you stand among your peers","Utilize the opportunity to change any incorrect arrangement of choices","Carefully understand where you stand among your peers","Utilize the opportunity to change any incorrect arrangement of choices","Pay the counselling fees well before due-date to avoid last minute failures","Carefully understand your reporting center and report well in time","View our Mistakes section to know more about what mishaps student commit during this step","Visit your respective college website to know about deadlines for admission to colleges","Thank you for your cooperation! Don't forget to provide feedback for our services"];
class Progress extends StatefulWidget{
  _Progress createState()=> _Progress();

}
bool state = false;
class _Progress extends State<Progress>{
  Future<void> createarr() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int flag=0;
    for(int i=0;i<12;i++)
    {
      indexes[i]=(sharedPreferences.get(i.toString())==null)?2:sharedPreferences.get(i.toString());
      if(flag==0&&indexes[i]==2)
        {
          ctr=i;
          flag=1;
        }
    }
    setState(() {
      state = true;
    });
  }
  Future<void> destroyarr() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    for(int i=0;i<12;i++)
    {
      sharedPreferences.setInt(i.toString(), indexes[i]);
    }
  }
  @override
  void initState(){
    state = false;
    super.initState();
    createarr();
  }
  @override
  void dispose(){
    destroyarr();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return (state==false)?Container(height: double.infinity,width: double.infinity,child: Center(
      child: Container(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(),
      ),
    ),):Scaffold(
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
              height: MediaQuery.of(context).size.height-290,
              color: Colors.white70,
            ),
          ),
          Positioned(
            left: 85,
            bottom: 121,
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
            top: 250,
            left: 62.5,
            child: Container(
              height: MediaQuery.of(context).size.height-370,
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
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width/2-80,
            child: Center(
              child: RaisedButton(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("View Deadlines",style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w300),),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PdfViewer1("https://josaa.nic.in/webinfo/File/GetFile?FileId=3&LangId=P")));
                },
              ),
            )
          )
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