import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:itu_cartrack/src/view/car_home_screen.dart';
import 'package:itu_cartrack/src/view/car_detail_screen.dart';
import 'package:itu_cartrack/src/view/car_expense_screen.dart';
import 'package:itu_cartrack/src/view/car_notes_screen.dart';
import 'package:itu_cartrack/src/view/car_history_screen.dart';

class CarNavigationBase extends StatefulWidget {
  @override
  _CarNavigationBaseState createState() => _CarNavigationBaseState();
}

class _CarNavigationBaseState extends State<CarNavigationBase> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    CarHomeScreen(),
    CarDetailScreen(),
    CarExpenseScreen(),
    CarHistoryScreen(),
    CarNotesScreen(),
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
      bottomNavigationBar: BottomAppBar(
        shape: MyShape(),
        notchMargin: 8.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding to both sides
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Left side icons
              IconButton(
                iconSize: 30.0, // Adjust icon size as needed
                icon: Icon(Icons.directions_car),
                onPressed: () => _onNavItemTapped(1),
              ),
              IconButton(
                iconSize: 30.0, // Adjust icon size as needed
                icon: Icon(Icons.attach_money),
                onPressed: () => _onNavItemTapped(2),
              ),
              // Padding to account for the FAB
              SizedBox(width: 72), // Adjust the width to create space for the FAB
              // Right side icons
              IconButton(
                iconSize: 30.0, // Adjust icon size as needed
                icon: Icon(Icons.history),
                onPressed: () => _onNavItemTapped(3),
              ),
              IconButton(
                iconSize: 30.0, // Adjust icon size as needed
                icon: Icon(Icons.note_alt_outlined),
                onPressed: () => _onNavItemTapped(4),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.speed,
          size: 30.0,
        ),
        onPressed: () => _onNavItemTapped(0),
      ),
    );
  }
}

class MyShape extends CircularNotchedRectangle {
  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null || !host.overlaps(guest)) return Path()..addRect(host);

    final double notchRadius = guest.width / 2.0;

    const double s1 = 8.0;
    const double s2 = 1.0;

    final double r = notchRadius;
    final double a = -1.0 * r - s2;
    final double b = host.top - guest.center.dy;

    final double n2 = math.sqrt(b * b * r * r * (a * a + b * b - r * r));
    final double p2xA = ((a * r * r) - n2) / (a * a + b * b);
    final double p2xB = ((a * r * r) + n2) / (a * a + b * b);
    final double p2yA = math.sqrt(r * r - p2xA * p2xA);
    final double p2yB = math.sqrt(r * r - p2xB * p2xB);

    // Correct way to create a fixed-length list of Offset
    final List<Offset> p = List<Offset>.filled(6, Offset.zero, growable: false);

    // p0, p1, and p2 are the control points for segment A
    p[0] = Offset(a - s1, b);
    p[1] = Offset(a, b);
    final double cmp = b < 0 ? -1.0 : 1.0;
    p[2] = cmp * p2yA > cmp * p2yB ? Offset(p2xA, -p2yA) : Offset(p2xB, p2yB);

    // p3, p4, and p5 are the control points for segment B, which is a mirror of segment A around the y axis
    p[3] = Offset(-1.0 * p[2].dx, p[2].dy);
    p[4] = Offset(-1.0 * p[1].dx, p[1].dy);
    p[5] = Offset(-1.0 * p[0].dx, p[0].dy);

    // Translate all points back to the absolute coordinate system
    for (int i = 0; i < p.length; i += 1)
      p[i] += guest.center;

    return Path()
      ..moveTo(host.left, host.top)
      ..lineTo(p[0].dx, p[0].dy)
      ..lineTo(p[1].dx, p[1].dy)
      ..arcToPoint(
        p[2],
        radius: Radius.circular(notchRadius),
        clockwise: false,
      )
      ..arcToPoint(
        p[3],
        radius: Radius.circular(notchRadius),
        clockwise: false,
      )
      ..lineTo(p[4].dx, p[4].dy)
      ..lineTo(p[5].dx, p[5].dy)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
  }
}

