import 'dart:math';
import 'package:counselling_gurus/Pages/Student/Branchblog.dart';
import 'package:counselling_gurus/Pages/Student/CollegePredictor.dart';
import 'package:counselling_gurus/Pages/Student/Collegeblog.dart';
import 'package:counselling_gurus/Pages/Student/CompleteNews.dart';
import 'package:counselling_gurus/components/oval_right_clipper.dart';
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
  "Aptitude Test"
];

List<IconData> icon = [
  Icons.school,
  Icons.score,
  Icons.home,
  Icons.library_books,
  Icons.supervisor_account,
  Icons.edit
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
    return Scaffold(
      key: _key,
      drawer: buildDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 180.0,
            backgroundColor: color.bgGrad,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                _key.currentState.openDrawer();
              },
            ),
            floating: true,
            flexibleSpace: ListView(
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
            }, childCount: 6),
          )
        ],
      ),
    );
  }

  buildDrawer(){
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
                  _buildRow(Icons.home, "Home"),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "My profile"),
                  _buildDivider(),
                  _buildRow(Icons.message, "Messages", showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.notifications, "Notifications",
                      showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.settings, "Settings"),
                  _buildDivider(),
                  _buildRow(Icons.email, "Contact us"),
                  _buildDivider(),
                  _buildRow(Icons.info_outline, "Help"),
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

  Widget _buildRow(IconData icon, String title, {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return Container(
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
    );
  }

  Widget trendingNews() {
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = ((size.height - kToolbarHeight - 24) / 2) - 20;
    final double itemWidth = size.width / 2;
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
            return Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 120,
                color: Colors.transparent,
                child: Center(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: colorList[Random().nextInt(8)]),
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
                    color: colorList[Random().nextInt(8)]),
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
                                            CollegePredictor()));
                              else if (index == 1) {
                              } else if (index == 2)
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Collegeblog()));
                              else if (index == 3)
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Branchblog()));
                            }),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
