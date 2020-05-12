import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:counselling_gurus/Pages/Student/IntroSlider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MentorInfo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColumnSuper(
        innerDistance: -50,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                  Colors.orange[900],
                  Colors.orange[800],
                  Colors.orange[400]
                ])),
            child: Text('\n\n\n\n\n  WELCOME BACK',style: TextStyle(color: Colors.white,fontSize: 18),),
          ),
          Material(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 50,
                  child: Text('PLEASE FILL IN THESE EXTRA DETAILS AS WELL',style: TextStyle(color: Colors.amber),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30,right: 30),
                  child: Material(
                    elevation: 20,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey[200]))
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "COLLEGE",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30,right: 30),
                  child: Material(
                    elevation: 20,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey[200]))
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "BRANCH",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30,right: 30),
                  child: Material(
                    elevation: 20,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey[200]))
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "STUDYING YEAR",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                RaisedButton(
                  child: Text('SUBMIT',style: TextStyle(color: Colors.white),),
                  color: Colors.pinkAccent,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => IntroSlider()));
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}