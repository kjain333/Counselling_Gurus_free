//import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:counselling_gurus/Fragments/ChatBoxPage.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import '../../Fragments/Students/HomePage.dart';
import 'package:flutter/material.dart';
import '../../Fragments/Students/NewsPage.dart';
import '../../Fragments/Students/ProfilePage.dart';

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
    return Scaffold(
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
