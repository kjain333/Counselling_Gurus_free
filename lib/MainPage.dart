import 'package:counselling_gurus/HomePage.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'NewsPage.dart';
import 'ProfilePage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;
  final _pageOptions = [
    ProfilePage(),
    HomePage(),
    NewsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counselling Gurus"),
      ),
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index){
          setState(() {
            _selectedPage = index;
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
