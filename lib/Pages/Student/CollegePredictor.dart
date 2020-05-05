import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';

import 'package:google_fonts/google_fonts.dart';

class CollegePredictor extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _CollegePredictorState();
  }
}
final mycontroller = TextEditingController();
class _CollegePredictorState extends State<CollegePredictor>{
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: SingleChildScrollView(
          child: ColumnSuper(
            innerDistance: -50,
            children: <Widget>[
              Container(

                height: 400,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blue,Colors.blueAccent,Colors.lightBlue,Colors.lightBlueAccent]
                    )
                ),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 150,
                    ) ,
                    ListTile(
                      title: Text('WELCOME TO COLLEGE PREDICTOR',style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                      subtitle: Text('ENTER YOUR RANK BELOW',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white)),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Theme(
                            data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                            child: TextField(
                              controller: mycontroller,
                              autofocus: false,
                              style: GoogleFonts.aBeeZee(fontSize: 15),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(left: 40,right: 40),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                )
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: RaisedButton(
                                  onPressed: (){
                                    //  mycontroller.clear();
                                      print(mycontroller.text);
                                      setState(() {
                                      });
                                     // mycontroller.clear();
                                  },
                                  child: Text('SUBMIT'),
                              ),
                                  
                          )
                        ],
                      ),
                    )

                  ],
                )
              ),
              Material(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))),
                elevation: 20,
                color: Colors.white,
                child: Container(
                  height: 1050,
                  width: 411,
                  child: Colleges()
                  //color: Colors.blue,
                ),
              ),

            ],
          ),
        )
    );
  }
}
class Colleges extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
       if(mycontroller.text=='')
          return Container();
       else {
         return Column(
           children: <Widget>[
             const SizedBox(
                 height: 50,
                 child: Center(
                   child: Text('HERE ARE OPTIONS AVAILABLE FOR YOU',
                     style: TextStyle(color: Colors.lightBlueAccent,
                         fontSize: 15,
                         fontWeight: FontWeight.w500),),

                 )
             ),
             Padding(
               padding: EdgeInsets.all(20),
               child: Material(
                   elevation: 20,
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(10))),
                   child: Column(

                     children: <Widget>[
                       Container(

                         height: 200,
                         decoration: BoxDecoration(
                             shape: BoxShape.rectangle,
                             borderRadius: BorderRadius.only(
                                 topLeft: Radius.circular(10),
                                 topRight: Radius.circular(10)),
                             image: DecorationImage(
                                 image: new AssetImage(
                                     'assets/images/college.png'),
                                 fit: BoxFit.fill
                             )
                         ),
                       ),
                       ListTile(
                           title: Text("COLLEGE NAME",
                             style: GoogleFonts.aBeeZee(fontSize: 15,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black),),

                           subtitle: Text("BRANCH NAME",
                             style: GoogleFonts.aBeeZee(
                                 fontSize: 10, color: Colors.black),)

                       ),

                     ],
                   )
               ),
             ),
             Padding(
               padding: EdgeInsets.all(20),
               child: Material(
                   elevation: 20,
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(10))),
                   child: Column(

                     children: <Widget>[
                       Container(

                         height: 200,
                         decoration: BoxDecoration(
                             shape: BoxShape.rectangle,
                             borderRadius: BorderRadius.only(
                                 topLeft: Radius.circular(10),
                                 topRight: Radius.circular(10)),
                             image: DecorationImage(
                                 image: new AssetImage(
                                     'assets/images/college.png'),
                                 fit: BoxFit.fill
                             )
                         ),
                       ),
                       ListTile(
                           title: Text("COLLEGE NAME",
                             style: GoogleFonts.aBeeZee(fontSize: 15,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black),),

                           subtitle: Text("BRANCH NAME",
                             style: GoogleFonts.aBeeZee(
                                 fontSize: 10, color: Colors.black),)

                       ),

                     ],
                   )
               ),
             ),
             Padding(
               padding: EdgeInsets.all(20),
               child: Material(
                   elevation: 20,
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(10))),
                   child: Column(

                     children: <Widget>[
                       Container(

                         height: 200,
                         decoration: BoxDecoration(
                             shape: BoxShape.rectangle,
                             borderRadius: BorderRadius.only(
                                 topLeft: Radius.circular(10),
                                 topRight: Radius.circular(10)),
                             image: DecorationImage(
                                 image: new AssetImage(
                                     'assets/images/college.png'),
                                 fit: BoxFit.fill
                             )
                         ),
                       ),
                       ListTile(
                           title: Text("COLLEGE NAME",
                             style: GoogleFonts.aBeeZee(fontSize: 15,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black),),

                           subtitle: Text("BRANCH NAME",
                             style: GoogleFonts.aBeeZee(
                                 fontSize: 10, color: Colors.black),)

                       ),

                     ],
                   )
               ),
             ),
             SizedBox(
               height: 50,
               child: ListTile(
                 leading: Icon(Icons.arrow_drop_down),
                 title: Text('READ MORE'),
                 contentPadding: EdgeInsets.only(left: 100, right: 100),
                 onTap: () {
                   showDialog(
                       context: context,
                       builder: (BuildContext context) {
                         return AlertDialog(
                           content: Container(
                             height: 400,
                             color: Colors.black,
                             child: Column(
                               children: <Widget>[
                                 const SizedBox(
                                   height: 30,
                                 ),
                                 ListTile(
                                   title: Center(
                                     child: Text('PREMIUM PASS',style: GoogleFonts.aBeeZee(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                                   )
                                 ),
                                 SizedBox(
                                   height: 50,
                                   width: 50,
                                   child: IconButton(
                                     icon: Icon(Icons.sentiment_very_satisfied,color: Colors.yellow,size: 50,),
                                     onPressed: (){
                                       return null;
                                     },
                                   ),
                                 ),
                                 SizedBox(
                                   height: 10,
                                 ),
                                 ListTile(
                                   leading: Icon(Icons.arrow_right,color: Colors.lightGreenAccent,),
                                   title: Text('FEATURE 1',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300,color: Colors.white),),

                                 ),
                                 ListTile(
                                   leading: Icon(Icons.arrow_right,color: Colors.lightGreenAccent,),
                                   title: Text('FEATURE 2',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300,color: Colors.white),),

                                 ),
                                 ListTile(
                                   leading: Icon(Icons.arrow_right,color: Colors.lightGreenAccent,),
                                   title: Text('FEATURE 3',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300,color: Colors.white),),

                                 ),
                                 SizedBox(
                                   height: 20,
                                 ),
                                 RaisedButton(
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(20),
                                   ),
                                   onPressed: (){
                                     return null;
                                   },
                                   color: Colors.pinkAccent,
                                   textColor: Colors.white,
                                   child: Text('UPGRADE',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w500,fontSize: 20),),
                                 )
                               ],
                             ),
                           )
                         );
                       }
                   );
                 },
               ),
             )

           ],
         );
       }
  }

}