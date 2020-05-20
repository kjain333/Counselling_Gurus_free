import 'dart:convert';
import 'dart:core';
import 'package:counselling_gurus/Pages/Student/HomePageSources/CompleteNews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}


  final bgcolor = [
    Colors.purpleAccent,
    Colors.indigoAccent,
    Colors.lightBlueAccent,
    Colors.greenAccent,
    Colors.cyanAccent,
    Colors.orangeAccent,
    Colors.redAccent,
    Colors.white
  ];

  JsonDecoder jsonDecoder = new JsonDecoder();
  bool loader = false;
  Map<String, dynamic> jsonData;
  List<String> heading = new List(20);
  List<String> subheading = new List(20);
  int news;

class _NewsPageState extends State<NewsPage> {

  @override
  void initState() {
//    loader = true;
//    getNews();
    super.initState();
  }

//  getNews() async {
//    Uri uri = Uri.parse('http://192.168.43.70:3060/getnews');
//    http.Response response =
//        await http.get(uri, headers: {"Accept": "application/json"});
//    print(response.body);
//    if (response.statusCode == 200) {
//      setState(() {
//        jsonData = jsonDecoder.convert(response.body);
//        news = jsonData['count'];
//        for(int i=0; i<news; i++){
//          heading[i] = jsonData['item'][i]['heading'];
//          subheading[i] = jsonData['item'][i]['subheading'];
//        }
//        loader = false;
//      });
//    } else {
//      throw Exception('Failed to load data');
//    }
//  }



  @override
  Widget build(BuildContext context) {
    return loader ? Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.orangeAccent,
      ),
    ):
    ListView.builder(
      itemCount: 10,  //news + 1
      itemBuilder: (context, index) {
        if (index == 0) {
          return SizedBox(
            height: 50,
            child: Center(
              child: Text('HOT NEWS',style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.lightBlueAccent)),
            )
          );
        } else
          return  Stack(
            children: <Widget>[
              Container(
                height: 200,
                color: bgcolor[(index==1?7:(index%7-1==-1?6:index%7-1))],
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                  color: bgcolor[index%7],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CompleteNews('NEWS HEADING')));
                  },
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 20,
                          ),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/background.png'),
                                  fit: BoxFit.fill,
                                )),
                          ),
                          Container(
                            width: 290.5,
                            child: ListTile(
                              title: Text(
                                'NEWS HEADING ' + index.toString(),//heading[index-1]
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              subtitle: Text(
                                'Here we can put the news sub-heading.',//subheading[index-1]
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 12, color: Colors.white),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CompleteNews('News Heading'))); //pass news as parameter and do changes in Complete News
                              },
                              trailing: Wrap(
                                children: <Widget>[
                                  IconButton(
                                      icon: new Icon(
                                        Icons.content_copy,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        Clipboard.setData(ClipboardData(
                                            text:
                                            'NEWS HEADING\nThis is news Sub-Heading'));//heading[index-1],subheading[index-1]
                                        final snackBar = SnackBar(
                                            content: Text(
                                                "Content Copied to Clipboard"));
                                        Scaffold.of(context)
                                            .showSnackBar(snackBar);
                                      }),
                                  IconButton(
                                      icon: new Icon(
                                        Icons.share,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        Share.share(
                                            'NEWS HEADING\nDOWNLOAD OUR APP',//heading[index-1]
                                            subject: 'NEWS HEADING');
                                      })
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              )
            ],
          );
      },
    );
  }
}
