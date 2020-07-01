import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:counselling_gurus/Animations/FadeAnimation.dart';
import 'package:counselling_gurus/Pages/Mentor/StartingPages/IntroSlider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Resources/Colors.dart' as color;
List<String> _years = ['Fresher','Sophomore','Pre-final Year','Final Year'];
String Selectedyear;
class MentorInfo extends StatefulWidget{
  @override
  _MentorInfo createState()=>_MentorInfo();
}
class _MentorInfo extends State<MentorInfo>{
  TextEditingController _controller = new TextEditingController();
  TextEditingController _controller1 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: ColumnSuper(
          innerDistance: -50,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 270,
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                    color.bgGrad,
                    color.bgGrad1,
                    color.bgGrad2,
                    color.bgGrad3
                  ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                SizedBox(
                height: 80,
                ),
                Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                        1.3,
                        Text(
                          "Welcome Back",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ],
            ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 520,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Text("College Name",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w300),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40,top: 20,right: 40),
                    child: TextField(
                      controller: _controller1,
                      decoration: InputDecoration(
                        hintText: "Enter College Name",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Text("Branch Name",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w300),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40,top: 20,right: 40),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          hintText: "Enter Branch Name",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Text("College Year",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w300),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButton(
                    onTap: (){
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                    isExpanded: false,
                    hint: Text('Please choose your college year'),
                    value: Selectedyear,
                    onChanged: (val){
                      setState(() {
                        Selectedyear = val;

                      });
                    },
                    items: _years.map((String val){
                      return DropdownMenuItem<String>(
                        child: Column(
                          children: <Widget>[
                            Text(val,style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 18),),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        value: val,
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  RaisedButton(
                    color: Colors.redAccent,
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  IntroSlider()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      ),
                    child: Text("SUBMIT",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
          ],
      ),
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