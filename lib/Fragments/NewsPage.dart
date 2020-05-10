import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'package:counselling_gurus/Pages/Student/CompleteNews.dart';
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

int _timerCounter = 0;
ScrollController controller = ScrollController(initialScrollOffset: 0);

  void _incrementTimerCounter(Timer t) {
    _timerCounter++;
    if (_timerCounter == 6) _timerCounter = 0;
    if (controller.hasClients) controller.jumpTo(_timerCounter.toDouble() * 410);
  }

  final string = [
    'assets/images/background.png',
    'assets/images/background2.png'
  ];

  final bgcolor = [
    Colors.purpleAccent,
    Colors.indigoAccent,
    Colors.lightBlueAccent,
    Colors.greenAccent,
    Colors.yellowAccent,
    Colors.orangeAccent,
    Colors.redAccent
  ];

  JsonDecoder jsonDecoder = new JsonDecoder();
  bool loader = false;
  Map<String, dynamic> jsonData;
  List<String> heading, subheading;
  int news;

class _NewsPageState extends State<NewsPage> {
  getNews() async {

    Uri uri = Uri.parse('http://192.168.43.70:3060/getnews');
    http.Response response =
        await http.get(uri, headers: {"Accept": "application/json"});
    print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        jsonData = jsonDecoder.convert(response.body);
        news = jsonData['count'];
        for(int i=0;i<news;i++){
          heading[i] = jsonData['item'][i].heading;
          subheading[i] = jsonData['item'][i].subheading;
        }
        loader = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Timer _timer = new Timer.periodic(
      new Duration(milliseconds: 5000), _incrementTimerCounter);

  @override
  Widget build(BuildContext context) {
    _timerCounter = 0;
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        if (index == 0) {
          return SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: controller,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [bgcolor[0], bgcolor[1]],
                    )),
                    width: 410.5,
                    height: 200,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 20,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(string[index % 2]),
                                fit: BoxFit.fill,
                              )),
                        ),
                        Container(
                          width: 290.5,
                          child: ListTile(
                            title: Text(
                              'TRENDING NEWS HEADING ' + index.toString(),
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            subtitle: Text(
                              'News subheading can come here',
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 15, color: Colors.white),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CompleteNews(string[1])));
                            },
                          ),
                        )
                      ],
                    ));
              },
            ),
          );
        } else
          return Container(
              /* onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CompleteNews(string[1])));
              },*/
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      bgcolor[index % 7],
                      bgcolor[(index % 7 + 1 == 7) ? 0 : (index % 7 + 1)]
                    ],
                  )),
              child: Padding(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                child: Material(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CompleteNews(string[1])));
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 300,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                image: DecorationImage(
                                    image: new AssetImage(
                                        'assets/images/background.png'),
                                    fit: BoxFit.fill)),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: Colors.black,
                            ),
                            child: ListTile(
                                title: Text(
                                  "NEWS HEADING",
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                subtitle: Text(
                                  "DATE\nThis is news Sub-heading",
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 10, color: Colors.white),
                                ),
                                trailing: Wrap(
                                  children: <Widget>[
                                    IconButton(
                                        icon: new Icon(
                                          Icons.content_copy,
                                          color: Colors.yellowAccent,
                                        ),
                                        onPressed: () {
                                          Clipboard.setData(ClipboardData(
                                              text:
                                                  'NEWS HEADING\nThis is news Sub-Heading'));
                                          final snackBar = SnackBar(
                                              content: Text(
                                                  "Content Copied to Clipboard"));
                                          Scaffold.of(context)
                                              .showSnackBar(snackBar);
                                        }),
                                    IconButton(
                                        icon: new Icon(
                                          Icons.share,
                                          color: Colors.yellowAccent,
                                        ),
                                        onPressed: () {
                                          Share.share(
                                              'NEWS HEADING\nDOWNLOAD OUR APP',
                                              subject: 'NEWS HEADING');
                                        })
                                  ],
                                )),
                          )
                        ],
                      ),
                    )),
              ));
      },
    );
  }
}
