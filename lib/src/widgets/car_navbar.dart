import 'package:itu_cartrack/src/view/car_home_screen.dart';
import 'package:itu_cartrack/src/view/car_detail_screen.dart';
import 'package:itu_cartrack/src/view/car_expense_screen.dart';
import 'package:itu_cartrack/src/view/car_notes_screen.dart';
import 'package:itu_cartrack/src/view/car_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class CarNavigationBase extends StatefulWidget {
  @override
  _CarNavigationBaseState createState() => _CarNavigationBaseState();
}

class _CarNavigationBaseState extends State<CarNavigationBase> {
  int _currentIndex = 2;

  final List<Widget> _pages = [
    CarDetailScreen(),
    CarExpenseScreen(),
    CarHomeScreen(),
    CarHistoryScreen(),
    CarNotesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        backgroundColor: theme.colorScheme.secondary,
        items: [
          TabItem(icon: Icons.directions_car, title: 'Home'),
          TabItem(icon: Icons.attach_money, title: 'Expenses'),
          TabItem(icon: Icons.speed, title: 'Ride'),
          TabItem(icon: Icons.history, title: 'History'),
          TabItem(icon: Icons.note_alt_outlined, title: 'Notes'),
        ],
        initialActiveIndex: _currentIndex,
        onTap: (int i) {
          setState(() {
            _currentIndex = i;
          });
        },
      ),
    );
  }
}
