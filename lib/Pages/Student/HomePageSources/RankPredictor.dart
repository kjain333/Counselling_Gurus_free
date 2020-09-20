import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:toast/toast.dart';
import 'package:http/io_client.dart';

import 'CollegePredictor.dart';
class RankPredictor extends StatefulWidget{

  _Rankpredictor createState() => _Rankpredictor();
}
String rank ='';
String category = '';
class _Rankpredictor extends State<RankPredictor>{
  TextEditingController marks = new TextEditingController();
  Future<dynamic> createColleges(a,b) async {
    print(a);
    var map = new Map<String, dynamic>();
    map['marks'] = a;
    map['category'] = b;
    final ioc = new HttpClient();
    ioc.badCertificateCallback = (X509Certificate cert,String host,int port)=>true;
    final http = new IOClient(ioc);
    var url;
    url = 'https://counsellinggurus.in:3001/rank-advanced';
    await http.post(
      url,
      body: map,
    ).then((response){

      setState(() {
        print(response.body);
        rank=response.body;
        showMyrank(context);
      });

    }).catchError(throw Exception("failed to load"));
  }
  @override
  void dispose() {
    marks.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton(
         backgroundColor: Colors.lightBlueAccent,
         onPressed: (){

           Navigator.push(context, MaterialPageRoute(builder: (context)=> CollegePredictor()));
           if(category==''||marks.text=='')
             Toast.show("Please enter both marks and category for accurate results",context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
           else
           {
             createColleges(marks.text,category);
           }
         },
         child: Icon(
           Icons.arrow_forward,
           color: Colors.white,
         ),
       ),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.purple,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height-90,
                left: 30,
                child: showRank(context),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height-100,
                  width: MediaQuery.of(context).size.width-30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(100)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
                    child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Text('Welcome to Rank Prediction',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w900,fontSize: 20),),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text('Anxious about how you performed? Don\'t worry! Our rank prediction software provides you with most accurate results',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 16),),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Enter Your JEE-Advanced Marks',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300),),
                        Padding(
                          padding: EdgeInsets.only(left: 40,right: 40,top: 5),
                          child: TextField(
                            controller: marks,
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                                hintText: 'JEE-Advanced marks',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: (
                                      BorderRadius.circular(15)
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.grey
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: (
                                      BorderRadius.circular(15)
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.grey
                                  ),
                                )
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text('Choose your Category',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300),),
                        RadioGroup(),
                        SizedBox(
                          height: 10,
                        ),
                        RaisedButton(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Colors.blue,
                          onPressed: (){
                            if(category==''||marks.text=='')
                              Toast.show("Please enter both marks and category for accurate results",context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                            else
                              {
                                createColleges(marks.text,category);
                              }

                              //Assign Rank Here
                          },
                          child: Text('Get Your Rank',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w900,fontSize: 15,color: Colors.white),),
                        ),
                      ],
                    ),
                ),
                  ),
              ),
              ),
            ],
          ),
        )
    );
  }

}
class RadioGroup extends StatefulWidget{
  @override
  RadioGroupWidget createState() {
    return RadioGroupWidget();
  }

}

class RadioGroupWidget extends State{
  final index = [1,2,3,4,5];
  int val;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile(title: Text('OBC-NCL',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 15),), groupValue: val, onChanged: (index) => setState((){ val=1;category = "OBC-NCL";}),value: index[0],),
        RadioListTile(title: Text('GEN-EWS',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 15),), groupValue: val, onChanged: (index) =>  setState((){ val=2;category = "GEN-EWS";}),value: index[1],),
        RadioListTile(title: Text('SC',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 15),), groupValue: val, onChanged: (index) => setState((){ val=3;category = "SC";}),value: index[2],),
        RadioListTile(title: Text('ST',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 15),), groupValue: val, onChanged: (index) =>  setState((){ val=4;category = "ST";}),value: index[3],),
        RadioListTile(title: Text('General',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 15),), groupValue: val, onChanged: (index) =>  setState((){ val=5;category = "General";}),value: index[4],),
       // RadioListTile(title: Text('Girls'), groupValue: val, onChanged: (index) => setState(() => val=5),value: index[4],),
      ],
    );
  }

}
Widget showRank(BuildContext context){
  if(rank=='')
  return Container();
  else
    return Container(
     /* width: MediaQuery.of(context).size.width-50,
      child: Row(
        children: <Widget>[
          Text('RANK: ',style: GoogleFonts.aBeeZee(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),),
          Text(rank.toString(),style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white),),

        ],
      )*/
    );
}
showMyrank(context){
  showDialog(context: context,child: Scaffold(
    backgroundColor: Colors.transparent,
    body: Center(
      child: Container(
        height: 100,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text('Your Rank: '+rank,style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.white),),
            ),
            color: Colors.orangeAccent,
          ),
        ),
      ),
    ),
  ));
}