

import 'package:counselling_gurus/Pages/Student/Branchblog.dart';
import 'package:counselling_gurus/Pages/Student/CollegePredictor.dart';
import 'package:counselling_gurus/Pages/Student/Collegeblog.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  List<String> cardHeadings = ["College Predictor", "Get your Rank", "Colleges", "Branches", "Mock Counselling", "Aptitude Test"];
  List<IconData> icon = [Icons.school, Icons.score, Icons.home,Icons.library_books,Icons.supervisor_account,Icons.edit];
  String paragraph = "These are few lines describing each card to be displayed on the back.\nHere is some more random text so that the button can reach the botttom";
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = ((size.height - kToolbarHeight - 24) / 2) - 20;
    final double itemWidth = size.width / 2;

    return Scaffold(

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/ChatBoxPage');
        },
        icon: Icon(Icons.question_answer),
        label: Text("ChatBox"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
        backgroundColor: Colors.blue,
      ),

      body: Container(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Trending Experts',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: CircleImages(),
                )),
            SizedBox(height: 40,),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: (itemWidth / itemHeight),),
                  children: <Widget>[
                    gridCard(cardHeadings[0],icon[0],paragraph,0),
                    gridCard(cardHeadings[1],icon[1],paragraph,1),
                    gridCard(cardHeadings[2],icon[2],paragraph,2),
                    gridCard(cardHeadings[3],icon[3],paragraph,3),
                    gridCard(cardHeadings[4],icon[4],paragraph,4),
                    gridCard(cardHeadings[5],icon[5],paragraph,5),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget gridCard(cardHeading,icon,para,index){

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: FlipCard(
          direction: FlipDirection.VERTICAL,
          front: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              //side: BorderSide(width: 1, color: Colors.black),
            ),
            color: Colors.white,
            elevation: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.deepOrangeAccent,Colors.orangeAccent]
                )
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 60,
                  ),
                  Icon(
                      icon,size: 60,color: Colors.white,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListTile(
                    title: Center(child: Text(cardHeading, style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),),
                    subtitle: Text('Here we will put some lines of predefined text',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 13,color: Colors.white),),
                  ),
                ],
              ),
            )
          ),
          back: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
             // side: BorderSide(width: 1, color: Colors.black),
            ),
            color: Colors.yellow,
            elevation: 10,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.blueAccent,Colors.lightBlueAccent]
                  )
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      height: 30
                    ),
                    SizedBox(
                        child: Text(para,style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 15,color: Colors.white),),
                      ),
                    Align(
                      alignment: Alignment.bottomCenter,
                        child: RaisedButton(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          color: Colors.purpleAccent,
                          child: Text('MORE DETAILS',style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 10),),
                          onPressed: (){
                            if(index == 0)
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CollegePredictor()));
                            else if(index == 1)
                              {}
                            else if(index == 2)
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Collegeblog()));
                            else if(index == 3)
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Branchblog()));
                          }
                        ),
                    )
                  ],
                ),
            )
        ),
      ),
    )
    );
  }
}

class CircleImages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CircleWidgets();
  }
}

class CircleWidgets extends State<CircleImages> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (var x = 0; x < 10; x++) {
      widgets.add(
          Column(children: <Widget>[
            Container(
              height: 70.0,
              width: 70.0,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(100, 0, 0, 0),
                      blurRadius: 3.0,
                      offset: Offset(3.0, 3.0))
                ],
                border: Border.all(
                    width: 1.0,
                    style: BorderStyle.solid,
                    color: Color.fromARGB(255, 0, 0, 0)),
                borderRadius: BorderRadius.circular(100.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: new AssetImage("assets/images/app_logo.png"),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: Text(
                  "Mentor's College",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 8,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
      ]));
    }
    return Container(
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(5.0),
        children: widgets,
      ),
    );
  }
}