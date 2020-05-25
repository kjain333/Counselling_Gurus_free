import 'dart:math';
//import 'file:///C:/Users/Ralex/Desktop/Counselling_Gurus/lib/Pages/Student/HomePageSources/Branchblog.dart';
//import 'file:///C:/Users/Ralex/Desktop/Counselling_Gurus/lib/Pages/Student/StartingPages/ChangePassword.dart';
//import 'file:///C:/Users/Ralex/Desktop/Counselling_Gurus/lib/Pages/Student/HomePageSources/Collegeblog.dart';
//import 'file:///C:/Users/Ralex/Desktop/Counselling_Gurus/lib/Pages/Student/SideNav/ContactUs.dart';
//import 'file:///C:/Users/Ralex/Desktop/Counselling_Gurus/lib/Pages/Student/HomePageSources/FAQ.dart';
import 'package:counselling_gurus/Pages/Student/HomePageSources/Branchblog.dart';
import 'package:counselling_gurus/Pages/Student/HomePageSources/CollegePredictor.dart';
import 'package:counselling_gurus/Pages/Student/HomePageSources/Collegeblog.dart';
import 'package:counselling_gurus/Pages/Student/HomePageSources/CompleteNews.dart';
import 'package:counselling_gurus/Pages/Student/HomePageSources/FAQ.dart';
import 'package:counselling_gurus/Pages/Student/HomePageSources/RankPredictor.dart';
import 'package:counselling_gurus/Pages/Student/Medical/MedicalBranchblog.dart';
import 'package:counselling_gurus/Pages/Student/Medical/MedicalCollegeBlog.dart';
import 'package:counselling_gurus/Pages/Student/Medical/MedicalCollegePredictor.dart';
import 'package:counselling_gurus/Pages/Student/Medical/MedicalRankPredictor.dart';
//import 'file:///C:/Users/Ralex/Desktop/Counselling_Gurus/lib/Pages/Student/HomePageSources/RankPredictor.dart';
//import 'package:counselling_gurus/Pages/Student/ScheduleMeeting.dart';
//import 'package:counselling_gurus/Pages/Student/SideNav/ContactUs.dart';
//import 'package:counselling_gurus/Pages/Student/SideNav/EditProfile.dart';
//import 'package:counselling_gurus/Pages/Student/SideNav/TermsAndConditions.dart';
//import 'package:counselling_gurus/Pages/Student/SideNav/TopMentors.dart';
//import 'package:counselling_gurus/Pages/Student/SideNav/feedback.dart';
//import 'package:counselling_gurus/Pages/Student/StartingPages/ChangePassword.dart';
import 'package:counselling_gurus/Pages/Student/StartingPages/Stream.dart';
//import 'file:///C:/Users/Ralex/Desktop/Counselling_Gurus/lib/Pages/Student/SideNav/TermsAndConditions.dart';
//import 'package:counselling_gurus/components/oval_right_clipper.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import '../../Resources/Colors.dart' as color;

final string = [
  'assets/images/background.png',
  'assets/images/background2.png'
];

double width;
int _timerCounter = 0;
Set<int> a= {};
Set<int> b= {};
ScrollController controller = ScrollController(initialScrollOffset: 0);
List<Color> colorList = [
  color.yellow,
  color.orange,
  color.orange10,
  color.orange3,
  color.yellow6,
  color.pink4,
  color.purple,
  color.blue7
];

List<String> cardHeadings = [
  "College Predictor",
  "Get your Rank",
  "Colleges",
  "Branches",
  "Mock Counselling",
  "Aptitude Test",
  "Frequently Asked Questions"
];

List<IconData> icon = [
  Icons.school,
  Icons.score,
  Icons.home,
  Icons.library_books,
  Icons.supervisor_account,
  Icons.edit,
  Icons.question_answer,
];

final Color primary = Colors.white;
final Color active = Colors.grey.shade800;
final Color divider = Colors.grey.shade600;

String paragraph =
    "These are few lines describing each card to be displayed on the back.\nHere is some more random text so that the button can reach the botttom";

Timer _timer;

void _incrementTimerCounter(Timer t) {
  _timerCounter++;
  if (_timerCounter == 6) _timerCounter = 0;
  // if (controller.hasClients) controller.jumpTo(_timerCounter.toDouble() * 410);
  if (controller.hasClients)
    controller.animateTo(_timerCounter.toDouble() * width,
        duration: Duration(milliseconds: 1000), curve: Curves.easeOut);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _timerCounter = 0;
  }

  @override
  Widget build(BuildContext context) {
    a.clear();
    b.clear();
    return Scaffold(
      key: _key,

     // drawer: buildDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
          //  leading: null,
        /*    IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                _key.currentState.openDrawer();
              },
            ),*/
           // floating: true,
            child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              color: color.bgGrad,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 70,),
                  Text(
                    "Home Page",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  )
                ],
              ),
            )
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: trendingNews(),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return gridCard(index);
            }, childCount: 7),
          )
        ],
      ),
    );
  }

/*  buildDrawer(){
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: active,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.orange, Colors.deepOrange])),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/images/app_logo.png"),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "erika costell",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "@erika07",
                    style: TextStyle(color: active, fontSize: 16.0),
                  ),
                  SizedBox(height: 30.0),
                  _buildRow(Icons.schedule, "Schedule Meeting",1),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "Edit profile",2),
                  _buildDivider(),
                  _buildRow(Icons.message, "Feedback",3, showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.notifications, "Change Password",4,
                      showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.person, "Mentor",5),
                  _buildDivider(),
                  _buildRow(Icons.email,"Contact us",6),
                  _buildDivider(),
                  _buildRow(Icons.info_outline,"Terms and Conditions",7),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }

  Widget _buildRow(IconData icon, String title,int index, {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return GestureDetector(
      onTap: (){
        if(index==1)
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ScheduleMeeting()));
        else if(index==2)
        Navigator.push(context,MaterialPageRoute(builder: (context)=>EditProfile()));
        else if(index==3)
          Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedbackPage()));
        else if(index==4)
          Navigator.push(context,MaterialPageRoute(builder: (context)=>ChangePassword()));
        else if(index==5)
          Navigator.push(context,MaterialPageRoute(builder: (context)=>TopMentors()));
        else if(index==6)
          Navigator.push(context,MaterialPageRoute(builder: (context)=>ContactUs()));
        else if(index==7)
          Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsAndConditions()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(children: [
          Icon(
            icon,
            color: active,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: tStyle,
          ),
        ]),
      ),
    );
  }
*/
  Widget trendingNews() {

    if(_timer!=null)
      _timer.cancel();
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    //final double itemHeight = ((size.height - kToolbarHeight - 24) / 2) - 20;
    //final double itemWidth = size.width / 2;
    width = size.width;
    _timer = new Timer.periodic(
        new Duration(milliseconds: 5000), _incrementTimerCounter);
    return Container(
        color: Colors.transparent,
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: controller,
          itemCount: 6,
          itemBuilder: (context, index) {
            int random;
            random = Random().nextInt(8);
            if(b.contains(random)&&b.length<=8)
            {
              while(b.contains(random))
              {
                random=Random().nextInt(8);
              }
            }
            b.add(random);
            return Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 120,
                color: Colors.transparent,
                child: Center(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: colorList[random]),
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 20,
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(string[index % 2]),
                                  fit: BoxFit.fill,
                                )),
                          ),
                          Expanded(
                            child: Container(
                              child: ListTile(
                                title: Text(
                                  'TRENDING NEWS HEADING' + index.toString(),
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                subtitle: Text(
                                  'News subheading can come here',
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 12, color: Colors.white),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CompleteNews(string[1])));
                                },
                              ),
                            ),
                          )
                        ],
                      )),
                ));
          },
        ));
  }

  Widget gridCard(index) {
    int random;
    random = Random().nextInt(8);
    if(a.contains(random)&&a.length<=8)
      {
        while(a.contains(random))
          {
            random=Random().nextInt(8);
          }
      }
    a.add(random);
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
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: colorList[random]),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    Icon(
                      icon[index],
                      size: 60,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      title: Center(
                        child: Text(
                          cardHeadings[index],
                          style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      subtitle: Text(
                        'Here we will put some lines of predefined text',
                        style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )),
          back: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                //side: BorderSide(width: 1, color: Colors.black),
              ),
              color: Colors.white,
              elevation: 10,
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: colorList[Random().nextInt(8)]),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "More Details",
                      style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    ListTile(
                      title: Center(
                        child: RaisedButton(
                            //elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.purpleAccent,
                            child: Text(
                              'MORE DETAILS',
                              style: GoogleFonts.aBeeZee(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                            onPressed: () {
                              if (index == 0)
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        (GetStream()==0?CollegePredictor():MedicalCollegePredictor())));
                               else if (index == 2)
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => (GetStream()==0)?Collegeblog():MedicalCollegeblog()));
                              else if (index == 3)
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => (GetStream()==0?Branchblog():MedicalBranchblog())));
                              else if (index==6)
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQ()));
                              else if (index == 1)
                                Navigator.push(context, MaterialPageRoute(builder: (context) => (GetStream()==0?RankPredictor():MedicalRankPredictor())));
                            }),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
