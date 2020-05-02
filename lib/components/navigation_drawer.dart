import 'package:counselling_gurus/models/navigation_model.dart';
import 'package:counselling_gurus/models/themes.dart';
import 'package:flutter/material.dart';
import '../Pages/Student/SlideNav.dart';

import 'collapsing_list_tile.dart';

class CollapsingNavigationDrawer extends StatefulWidget {

  @override
  _CollapsingNavigationDrawerState createState() => _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
                                     with SingleTickerProviderStateMixin{

  double maxWidth = 220;
  double minWidth = 70;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex;

  SlideNav parent;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _animationController, builder: (context, widget) => getWidget(context, widget),);
  }

  Widget getWidget(context, widget){
    return Material(
      elevation: 80.0,
      child: Container(
        width: widthAnimation.value,
        color: drawerBackgroundColor,
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0,),
            CollapsingListTile(
              title: "Anubhav Ajmera",
              icon: Icons.person,
              animationController: _animationController
            ),
            Divider(color: Colors.grey, height: 20.0,),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return Divider(height: 10.0,);
                },
                itemBuilder: (context, counter) {
                return CollapsingListTile(
                  onTap: (){
                    setState(() {
                      currentSelectedIndex = counter;
                    });
                  },
                  isSelected: currentSelectedIndex == counter,
                  title: navigationItems[counter].title,
                  icon: navigationItems[counter].icon,
                  animationController: _animationController,
                );
              },
                itemCount: navigationItems.length,
              ),
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    isCollapsed = !isCollapsed;
                    isCollapsed ? _animationController.reverse(): _animationController.forward();
                  });
                },
                child: AnimatedIcon(
                  icon: AnimatedIcons.close_menu,
                  progress: _animationController,
                )
            ),
            SizedBox(height: 50.0,),
          ],
        ),
      ),
    );
  }

}
