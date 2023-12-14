import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/view/car_home_screen.dart';
import 'package:itu_cartrack/src/view/car_detail.dart';
import 'package:itu_cartrack/src/view/car_expense.dart';

class CarNavigationBase extends StatefulWidget {
  @override
  _CarNavigationBaseState createState() => _CarNavigationBaseState();
}

class _CarNavigationBaseState extends State<CarNavigationBase> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    CarHomeScreen(), // CarHomeScreen is always first
    CarDetailScreen(),
    CarExpenseScreen(), // Added CarExpenseScreen
    // Add other screens here if needed
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Details',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Expenses', // New item for CarExpenseScreen
          ),
          // Add other items here
        ],
      ),
    );
  }
}
