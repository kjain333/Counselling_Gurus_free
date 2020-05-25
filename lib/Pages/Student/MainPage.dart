//import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:counselling_gurus/Fragments/ChatBoxPage.dart';
import 'package:counselling_gurus/components/oval_right_clipper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import '../../Fragments/Students/HomePage.dart';
import 'package:flutter/material.dart';
import '../../Fragments/Students/NewsPage.dart';
import '../../Fragments/Students/ProfilePage.dart';
import 'ScheduleMeeting.dart';
import 'SideNav/ContactUs.dart';
import 'SideNav/EditProfile.dart';
import 'SideNav/TermsAndConditions.dart';
import 'SideNav/TopMentors.dart';
import 'SideNav/feedback.dart';
import 'StartingPages/ChangePassword.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //For bottom nav
  int _selectedPage = 0;
  var _pageOptions = [
    ProfilePage(),
    HomePage(),
    NewsPage(),
    ChatBoxPage(),
  ];
  var _pageController = new PageController();

  @override 
  Widget build(BuildContext context) {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('COUNSELLING GURUS',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 18),),
      ),
      drawer: buildDrawer(),
      body: PageView(
        children: _pageOptions,
        onPageChanged: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        controller: _pageController,
      ),
        bottomNavigationBar: TitledBottomNavigationBar(
            reverse: true,
            currentIndex: _selectedPage, // Use this to update the Bar giving a position
            onTap: (index){
              setState(() {
                _selectedPage = index;
                _pageController.animateToPage(index,
                    duration: Duration(milliseconds: 300), curve: Curves.ease);
              });
            },
            items: [
              TitledNavigationBarItem(title: Text('Profile'), icon: Icons.person),
              TitledNavigationBarItem(title: Text('Home'), icon: Icons.home),
              TitledNavigationBarItem(title: Text('News'), icon: Icons.call),
              TitledNavigationBarItem(title: Text('Chat'), icon: Icons.question_answer),
            ]
        )
//      bottomNavigationBar: BottomNavigationBar(
//          selectedItemColor: Colors.orangeAccent,
//          unselectedItemColor: Colors.black26,
//          currentIndex: _selectedPage,
//          onTap: (int index) {
//            setState(() {
//              _selectedPage = index;
//              _pageController.animateToPage(_selectedPage,
//                  duration: Duration(microseconds: 200), curve: Curves.linear);
//            });
//          },
//          items: [
//            BottomNavigationBarItem(
//                icon: Icon(Icons.person), title: Text("Profile")),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.home), title: Text("Home")),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.call), title: Text("News")),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.more), title: Text("More")),
//          ]),
    );
  }
}
