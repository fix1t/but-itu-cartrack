/// This widget is responsible for managing the tabs and the navigation between users and cars
/// @Author:  Adam Gabrys xgabry01

import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/view/user_list_screen.dart';
import 'package:itu_cartrack/src/view/car_list_screen.dart';

class TabManager extends StatefulWidget {
  @override
  _TabManagerState createState() => _TabManagerState();
}

class _TabManagerState extends State<TabManager> {
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar removed
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          UserListScreen(),
          CarListScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Cars',
          ),
        ],
      ),
    );
  }
}
