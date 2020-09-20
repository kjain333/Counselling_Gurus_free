import 'package:counselling_gurus/Pages/Student/Fragments/Dashboard.dart';
import 'package:counselling_gurus/Pages/Student/Fragments/NewsPage.dart';
import 'package:counselling_gurus/components/navigation_drawer.dart';
import 'package:counselling_gurus/models/themes.dart';
import 'package:flutter/material.dart';
import 'Fragments/HomePage.dart';
import 'Fragments/MorePage.dart';


class SlideNav extends StatefulWidget {

  @override
  _SlideNavState createState() => _SlideNavState();
}

class _SlideNavState extends State<SlideNav> {

  //For nav
  int _selectedPage = 0;
  var _pageOptions = [
    HomePage(),
    Dashboard(),
  ];
  var _pageController = new PageController(initialPage: 0);

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
