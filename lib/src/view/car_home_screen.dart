import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';
import 'package:itu_cartrack/src/model/car.dart';

class CarHomeScreen extends StatelessWidget {
  final Car selectedCar = CarController.activeCar;

  CarHomeScreen();

  @override
  Widget build(BuildContext context) {
    // Use 'car' directly within this screen
    // For example:
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Home Screen'),
      ),
      body: Center(
        child: Text('Car Name: ${selectedCar.name}'),
      ),
    );
  }
}
