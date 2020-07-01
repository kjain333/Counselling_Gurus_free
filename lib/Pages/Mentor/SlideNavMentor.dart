import 'package:counselling_gurus/components/navigation_drawer.dart';
import 'package:counselling_gurus/models/themes.dart';
import 'package:flutter/material.dart';
import 'Fragments/ProfilePageMentor.dart';
import 'Fragments/HomePageMentor.dart';
import 'Fragments/NewsPageMentor.dart';


class SlideNavMentor extends StatefulWidget {

  @override
  _SlideNavMentorState createState() => _SlideNavMentorState();
}

class _SlideNavMentorState extends State<SlideNavMentor> {

  //For nav
  int _selectedPage = 0;
  var _pageOptions = [
    ProfilePageMentor(),
    HomePageMentor(),
    NewsPageMentor(),
  ];
  var _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: drawerBackgroundColor,
        title: Text("NavBar"),
      ),
      body: Stack(
        children: <Widget>[
        PageView(
        children: _pageOptions,
        onPageChanged: (index){
          setState(() {
            _selectedPage = index;
          });
        },
        controller: _pageController,
      ),
          CollapsingNavigationDrawer(),
        ],
      ),
    );
  }
}
