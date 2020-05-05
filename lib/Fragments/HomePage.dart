import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              ))
        ],
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
      widgets.add(Column(children: <Widget>[
        Container(
          height: 60.0,
          width: 60.0,
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(100, 0, 0, 0),
                  blurRadius: 5.0,
                  offset: Offset(5.0, 5.0))
            ],
            border: Border.all(
                width: 2.0,
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
            padding: EdgeInsets.all(2.0),
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
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(5.0),
        children: widgets,
      ),
    );
  }
}