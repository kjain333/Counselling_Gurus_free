import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PercentileCalculator extends StatefulWidget {
  @override
  _PercentileCalculatorState createState() => _PercentileCalculatorState();
}

final rankController = TextEditingController();

class _PercentileCalculatorState extends State<PercentileCalculator> {

  bool submitClicked = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: GestureDetector(
          onTap: (){
            FocusScopeNode currentFocus = FocusScope.of(context);
            if(!currentFocus.hasPrimaryFocus){
              currentFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: ColumnSuper(
              innerDistance: -50,
              children: <Widget>[
                Container(
                    height: 430,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.orange[900],
                              Colors.orange[800],
                              Colors.orange[400]
                            ]
                        )
                    ),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 70,
                        ) ,
                        ListTile(
                          title: Text('WELCOME TO RANK CALCULATOR',style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          child: Column(
                            children: <Widget>[
                              Theme(
                                data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: rankController,
                                    autofocus: false,
                                    style: GoogleFonts.aBeeZee(fontSize: 15),
                                    decoration: InputDecoration(
                                        hintText: "Enter Your JEE Mains Percentile",
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.only(left: 40,right: 40),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.circular(15),
                                        )
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: RaisedButton(
                                  onPressed: (){
                                    setState(() {
                                      submitClicked = true;
                                    });
                                  },
                                  child: Text('SUBMIT'),
                                ),
                              ),
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
                  child: submitClicked ? Container(
                        child: Congrats(),
                  ):
                  Container(
                    width: double.infinity,
                    height: 440,
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

class Congrats extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    if(rankController.text == ''){
      return Container(
          width: double.infinity,
          height: 440,
      );
    }else{
      return Container(
        width: double.infinity,
        height: 440,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: Text("Congratulations", style: GoogleFonts.aBeeZee(fontSize: 30, color: Colors.lightBlueAccent,),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
