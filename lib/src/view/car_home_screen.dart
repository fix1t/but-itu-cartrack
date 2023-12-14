import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';
import 'package:itu_cartrack/src/model/car.dart';

class CarHomeScreen extends StatelessWidget {
  final Car selectedCar = CarController.activeCar;

  CarHomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Car Name: ${selectedCar.name}'),
            SizedBox(height: 16), // Add spacing
            ElevatedButton(
              onPressed: () {
                // Navigate to /car/home/help
                Navigator.pushNamed(context, '/car/home/help');
              },
              child: Text('Go to Help'),
            ),
          ],
        ),
      ),
    );
  }
}
