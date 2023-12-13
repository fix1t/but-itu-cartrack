import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/model/car.dart';

class CarHomeScreen extends StatelessWidget {
  final Car car;

  CarHomeScreen({required this.car});

  @override
  Widget build(BuildContext context) {
    // Use 'car' directly within this screen
    // For example:
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Home Screen'),
      ),
      body: Center(
        child: Text('Car Name: ${car.name}'),
      ),
    );
  }
}
