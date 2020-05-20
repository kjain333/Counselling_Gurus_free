import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:counselling_gurus/Pages/Student/StartingPages/IntroSlider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Resources/Colors.dart' as color;

class MentorInfo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColumnSuper(
        innerDistance: -50,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                  color.bgGrad,
                  color.bgGrad1,
                  color.bgGrad2,
                  color.bgGrad3
                ])),
            child: Text('\n\n\n  WELCOME BACK',style: TextStyle(color: Colors.white,fontSize: 18),),
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
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                    elevation: 20,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                         // borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
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
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                    elevation: 20,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                          border: Border(bottom: BorderSide(color: Colors.grey[200]))
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: Text('STUDYING YEAR',style: TextStyle(color: Colors.grey),),
                          ),
                          RadioGroup()
                        ],
                      )
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  child: Text('SUBMIT',style: TextStyle(color: Colors.white),),
                  color: color.buttonsMain,
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
        RadioListTile(title: Text('Fresher'), groupValue: val, onChanged: (index) => setState((){ val=1;}),value: index[0],),
        RadioListTile(title: Text('Sophomore'), groupValue: val, onChanged: (index) => setState(() => val=2),value: index[1],),
        RadioListTile(title: Text('Pre-Final Year'), groupValue: val, onChanged: (index) => setState(() => val=3),value: index[2],),
        RadioListTile(title: Text('Final Year'), groupValue: val, onChanged: (index) => setState(() => val=4),value: index[3],),
        RadioListTile(title: Text('Passout'), groupValue: val, onChanged: (index) => setState(() => val=5),value: index[4],),
      ],
    );
  }

}