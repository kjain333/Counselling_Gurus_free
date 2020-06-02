import 'package:flutter/material.dart';

class QuesAnsPage extends StatelessWidget {

  String  title = 'So lets start with our Coding part';
  String  ques = 'The main advantage of flutter is that you can directly dive into the development of flutter without any prior knowledge on Android and iOS development. Sounds cool, right? Then let’s go ahead without further ado! \n Create a stateless widget ( preferably using Flutter Live Templates ) with the name ‘Dashboard’. Return a MaterialApp and include a scaffold widget as its child and a Hello World text to check the rendering.';
  int likeCounter = 129;
  // image attachment ko bhi lena h

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Query and Solutions "),
        ),
        body: Container(
          height: 300.0,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Title',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.attachment),
                            iconSize: 25,
                            tooltip: 'See attached image',
                            onPressed: (){

                              // Open image associated with this ques

                            }
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.thumb_up,
                              color: Colors.blue,
                              size: 25.0,
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              '$likeCounter',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      height: 20,
                      thickness: 3,
                    ),
                    Text(
                      'Ques',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        ques,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
