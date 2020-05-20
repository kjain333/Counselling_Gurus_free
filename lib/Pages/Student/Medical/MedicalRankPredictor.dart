import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'MedicalCollegePredictor.dart';
class MedicalRankPredictor extends StatefulWidget{

  _MedicalRankpredictor createState() => _MedicalRankpredictor();
}
int rank =0;
class _MedicalRankpredictor extends State<MedicalRankPredictor>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton(
         backgroundColor: Colors.lightBlueAccent,
         onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=> MedicalCollegePredictor()));
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
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 80,
                      ),
                      Text('Welcome to Rank Prediction Software',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w900,fontSize: 20),),
                      SizedBox(
                        height: 25,
                      ),
                      CircularPercentIndicator(
                        radius: 150.0,
                        lineWidth: 5.0,
                        percent: 0.8,
                        center: Padding(
                          padding: EdgeInsets.all(30),
                          child: new Text('Surveys show our rank predictor to be 80% accurate',style: GoogleFonts.aBeeZee(fontSize: 12,),),
                        ),
                        progressColor: Colors.purple,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Enter Your Percentile',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300),),
                      Padding(
                        padding: EdgeInsets.only(left: 40,right: 40,top: 5),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'PERCENTILE',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: (
                                    BorderRadius.circular(30)
                                ),
                                borderSide: BorderSide(
                                    color: Colors.grey
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: (
                                    BorderRadius.circular(30)
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
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.blue,
                        onPressed: (){
                          setState(() {
                            rank = 5087;
                          });
                            //Assign Rank Here
                        },
                        child: Text('SUBMIT',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w900,fontSize: 18,color: Colors.white),),
                      ),
                    ],
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
  final index = [1,2,3,4];
  int val;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile(title: Text('General'), groupValue: val, onChanged: (index) => setState((){ val=1;}),value: index[0],),
        RadioListTile(title: Text('General EWS'), groupValue: val, onChanged: (index) => setState(() => val=2),value: index[1],),
        RadioListTile(title: Text('SC/ST'), groupValue: val, onChanged: (index) => setState(() => val=3),value: index[2],),
        RadioListTile(title: Text('OBC'), groupValue: val, onChanged: (index) => setState(() => val=4),value: index[3],),
       // RadioListTile(title: Text('Girls'), groupValue: val, onChanged: (index) => setState(() => val=5),value: index[4],),
      ],
    );
  }

}
Widget showRank(BuildContext context){
  if(rank==0)
  return Container();
  else
    return Container(
      width: MediaQuery.of(context).size.width-50,
      child: Row(
        children: <Widget>[
          Text('RANK: ',style: GoogleFonts.aBeeZee(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),),
          Text(rank.toString(),style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white),),

        ],
      )
    );
}