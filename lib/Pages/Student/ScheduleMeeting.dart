import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ScheduleMeeting extends StatefulWidget{
  @override
  _ScheduleMeeting createState() {
    return _ScheduleMeeting();
  }

}
class _ScheduleMeeting extends State<ScheduleMeeting>{
  var date = new DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ColumnSuper(
          innerDistance: -50,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height/2+50,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 57.5,
                    left: MediaQuery.of(context).size.width-60,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.indigo,
                        ),
                        child: Icon(Icons.clear,color: Colors.white,size: 30,),
                      ),
                    )
                  ),
                  Positioned(
                    top: 150,
                    left: 30,
                    child: Text('Create New Meeting',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
                  ),
                  Positioned(
                    top: 200,
                    left: 30,
                    child: Text('Title',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w100,fontSize: 18,color: Colors.white),),
                  ),
                  Positioned(
                    top: 230,
                    left: 30,
                    child: Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width-60,
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'ENTER MEETING TITLE HERE',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          focusColor: Colors.white
                        ),
                      ),
                    )
                  ),
                  Positioned(
                    top: 290,
                    left: 30,
                    child: Text('Date',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w100,fontSize: 18,color: Colors.white),),
                  ),
                  Positioned(
                    top: 320,
                    left: 30,
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width-60,
                      child: ListTile(
                        title: Text(date.day.toString()+'/'+date.month.toString()+'/'+date.year.toString(),style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 18),),
                        trailing: IconButton(
                          icon: Icon(Icons.calendar_today,color: Colors.white),
                          onPressed: (){
                           SelectDate(context);
                          },
                        ),
                      ),
                    )
                  )
                ],
              ),
            ),
            Container(

              height: MediaQuery.of(context).size.height/2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Description',style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w100),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Material(
                      elevation: 30,
                      borderRadius: BorderRadius.circular(30),
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Help us know more about what you want from us.',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.white,
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.white,
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Text('SCHEDULE',style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 18),),
                    color: Colors.purpleAccent,
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                                elevation: 50,
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: BorderSide(
                                      color: Colors.amberAccent,
                                    )
                                ),
                                content: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Container(
                                    color: Colors.black,
                                    height: 70,
                                    child: Column(
                                      children: <Widget>[
                                        Text('Thank You!',style: GoogleFonts.aBeeZee(color: Colors.amber,fontSize: 25,fontWeight: FontWeight.bold),),
                                        Text('Your meeting has been fixed with Mr. XYZ at 21:00 IST',style: GoogleFonts.aBeeZee(color: Colors.amber,fontSize: 15,fontWeight: FontWeight.w100),),
                                      ],
                                    ),
                                  ),
                                )
                            );
                          }
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
  Future<Null> SelectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: date,
        lastDate: DateTime(date.year+1),


    );
    if(picked!=null)
      {
        setState(() {
          date = picked;
        });
      }
  }
}