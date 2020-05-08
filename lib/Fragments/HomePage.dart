import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  List<String> cardHeadings = ["Colleges", "Branches", "Mock Counselling", "Aptitude Test"];

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
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
                    gridCard(cardHeadings[0]),
                    gridCard(cardHeadings[1]),
                    gridCard(cardHeadings[2]),
                    gridCard(cardHeadings[3]),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget gridCard(cardHeading){

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: FlipCard(
          direction: FlipDirection.VERTICAL,
          front: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(width: 1, color: Colors.black),
            ),
            color: Colors.white,
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 8),
              child: Stack(
                children: <Widget>[
                  Center(
                      child: Text(cardHeading, style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),)
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text("Tap to get more info", style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey
                    ),),
                  )
                ],
              ),
            ),
          ),
          back: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(width: 1, color: Colors.black),
            ),
            color: Colors.yellow,
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 8),
              child: Stack(
                children: <Widget>[
                  Center(
                      child: RaisedButton(
                        child: Text("Get a list of colleges" , style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),),
                        onPressed: () {

                        },
                      )
                  ),
                ],
            ),
          ),
        ),
      ),
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
