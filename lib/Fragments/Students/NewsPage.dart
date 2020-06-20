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

import 'News.dart';

List<News> newsfinal = [News("AIIMS PG Entrance Result 2020 declared at aiimsexams.org","All India Institute of Medical Sciences, New Delhi has declared the result for its PG entrance exam conducted for July session admission on its official website at aiimsexams.org. The exam was conducted on June 11 for AIIMS Delhi, Bhopal, Bhubaneshwar, Jodhpur, Nagpur, Patna, Rishikesh and Raipur.Candidates whose roll number is there in the selection list are eligible for online seatallocation/Counselling. Candidates other than those who are not mentioned in the list can view their rank and percentile in the website www.aiimsexams.org after navigating through the Academic tab using their login credentials from June 19.The mock round of online subject allocation/ Counselling is expected to begin from Sunday, the 21st June 2020 followed by subsequent rounds of online subject allocation/counselling. The details will be available at www.aiimsexams.org.“Admission to various Postgraduate Courses (MD/MS/DM6Yrs/M.Ch. 6Yrs/MDS) in AIIMS New Delhi, Bhopal, Bhubaneswar, Jodhpur, Nagpur, Patna, Raipur & Rishikesh for the July 2020 Session is through Online Subject Allocation/Counselling process of AIIMS, New Delhi. All candidates are requested to familiarize themselves and follow all instructions related to online seat allocation/ counselling,” reads the official notice.There will be no counselling for Foreign/Sponsored Candidates. Click here to check AIIMS PG Entrance Merit List - ","https://www.aiimsexams.org/pdf/COUNSEL1_Rank_Wise-FINAL-NET.pdf"),
News("Beware of fake NTA notice on NEET-UG 2020 postponement being circulated: PIB","The Press Information Bureau (PIB) on Wednesday said that a fake WhatsApp message claiming that the NEET- UG entrance exam has been postponed to August is circulating on social media. PIB urged people to beware of this fake notice claiming to be that of NEET-UG exams.PIB has tweeted a fact-check regarding this on its official twitter handle.“Claim: A WhatsApp forward of an alleged public notice by @DG_NTA is doing rounds claiming that NEET- UG has been postponed to August. #PIBFackCheck: It’s #Fake. There is no such advisory on postponing the test. Check your info only from authentic sources,” reads the tweet.",""),
News("COMEDK UGET 2020 exam postponed, check fresh dates here","The Consortium of Medical, Engineering and Dental Colleges of Karnataka, or COMDEK, has postponed the COMEDK UGET 2020 exam dates to July 25, 2020. Earlier, the exam was scheduled to take place on June 26, 2020. But due to the Covid-19 situation, the consortium has decided to shift the dates ahead.The consortium has also decided to reopen the application process for UGET 2020 exams from June 14 to 17, 2020.The application correction facility has also been extended from June 1-3 to June 18-21, 2020.“In view of the health concerns due to Coronavirus, our helpline will remain closed. All queries will be answered by email only. Please address your queries to studenthelpdesk@comedk.org,” reads the statement flashing on the official website.For more details, candidates are advised to visit the official website -","https://www.comedk.org/"),
News("BITSAT 2020 exam schedule released, admit card from June 23","Birla Institute of Technology and Science (BITS), Pilani, has released the schedule for the Birla Institute of Technology and Science Admission Test 2020, or BITSAT 2020 on its official website.As per the schedule available on the official website, BITSAT 2020 Hall Ticket will be available to download from June 23 to August 10, 2020. Earlier, the institute had decided to conduct the BITSAT 2020 from August 6 to 10. The exam was re-scheduled to be held from May 16 to 25 but was postponed due to the nation-wide coronavirus lockdown.The test city allotment is scheduled on July 1, while the candidates will be able to choose their test date and slot on the official website from July 10 to July 16.For more details, candidates are advised to visit the official website -","https://www.bitsadmission.com/")
];
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
      itemCount: newsfinal.length+1,  //news + 1
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
                            builder: (context) => CompleteNews(newsfinal[index-1])));
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
                            width: MediaQuery.of(context).size.width-120,
                            child: ListTile(
                              title: Text(
                                newsfinal[index-1].heading,//heading[index-1]
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              subtitle: Text(
                                newsfinal[index-1].subheading,//subheading[index-1]
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 12, color: Colors.white),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CompleteNews(newsfinal[index-1]))); //pass news as parameter and do changes in Complete News
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
                                            newsfinal[index].heading+"\n"+newsfinal[index].subheading));//heading[index-1],subheading[index-1]
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
                                            newsfinal[index].heading+'\nDOWNLOAD OUR APP',//heading[index-1]
                                            subject: newsfinal[index].heading);
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
