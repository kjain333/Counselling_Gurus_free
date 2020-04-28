import 'package:counselling_gurus/Fragments/HomePage.dart';
import 'package:flutter/material.dart';
import '../Fragments/HomePage.dart';
import '../Fragments/NewsPage.dart';
import '../Fragments/ProfilePage.dart';

class DrawerItem{
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
  ];
  var _pageController = new PageController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Counselling Gurus"),
      ),
      body: PageView(
        children: _pageOptions,
        onPageChanged: (index){
          setState(() {
            _selectedPage = index;
          });
        },
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index){
          setState(() {
            _selectedPage = index;
            _pageController.animateToPage(_selectedPage, duration: Duration(microseconds: 200), curve: Curves.linear);
          });
        },
        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text("Profile")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.call),
              title: Text("News")
          ),
        ]
      ),
    );
  }
}
