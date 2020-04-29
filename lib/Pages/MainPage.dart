import '../Fragments/HomePage.dart';
import '../Fragments/MorePage.dart';
import 'package:flutter/material.dart';
import '../Fragments/NewsPage.dart';
import '../Fragments/ProfilePage.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

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
    MorePage(),
  ];
  var _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                  ),
                  onPressed: null),
              IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  onPressed: null),
              IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onPressed: null),
            ],
          )
        ],
        backgroundColor: Colors.black87,
        title: Text("Counselling Gurus"),
      ),
      body: PageView(
        children: _pageOptions,
        onPageChanged: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.orangeAccent,
          unselectedItemColor: Colors.black26,
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
              _pageController.animateToPage(_selectedPage,
                  duration: Duration(microseconds: 200), curve: Curves.linear);
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("Profile")),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.call), title: Text("News")),
            BottomNavigationBarItem(
                icon: Icon(Icons.more), title: Text("More")),
          ]),
    );
  }
}
