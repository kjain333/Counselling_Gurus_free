import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Dashboard", icon: Icons.insert_chart),
  NavigationModel(title: "News", icon: Icons.settings),
  NavigationModel(title: "Notifications", icon: Icons.notifications),
  NavigationModel(title: "Search", icon: Icons.search),
];