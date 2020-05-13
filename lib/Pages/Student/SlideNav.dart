import 'package:counselling_gurus/components/navigation_drawer.dart';
import 'package:counselling_gurus/models/themes.dart';
import 'package:flutter/material.dart';
import '../../Fragments/Students/ProfilePage.dart';
import '../../Fragments/Students/HomePage.dart';
import '../../Fragments/Students/NewsPage.dart';


class SlideNav extends StatefulWidget {

  @override
  _SlideNavState createState() => _SlideNavState();
}

class _SlideNavState extends State<SlideNav> {

  //For nav
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
