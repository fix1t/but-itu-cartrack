import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';
import 'package:itu_cartrack/src/model/car.dart';
import 'package:itu_cartrack/src/widgets/steering_wheel.dart';

class CarHomeScreen extends StatefulWidget {
  CarHomeScreen();

  @override
  _CarHomeScreenState createState() => _CarHomeScreenState();
}

class _CarHomeScreenState extends State<CarHomeScreen> {
  final Car selectedCar = CarController.activeCar;

  bool activeRide = false;
  double rotationAngle = 0;

  void showRouteStartedNotification() {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Your route has been started!'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                activeRide = !activeRide;
              });
            },
          ),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedCar.name}'),
      ),
      body: Column(
        children: [
          // Car Name + License Plate + Icon
          Container(
            height: MediaQuery.of(context).size.height * 0.20,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${selectedCar.name}',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '${selectedCar.licensePlate}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(width: 30),
                // TODO: Add car image
                // Car image
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.directions_car,
                      size: 100,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Dashboard Image + Odometer Status
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            // padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // help button
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: IconButton(
                      icon: Icon(Icons.car_crash_rounded),
                      color: Theme.of(context).colorScheme.secondary,
                      onPressed: () {
                        // go to help screen

                      }),
                ),
                // odometer + odometer status
                Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage('assets/images/o2.png'),
                            fit: BoxFit.contain,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          Text(
                            '${selectedCar.odometerStatus} km',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                //TODO: change font to digital/monospace
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                                fontFamily: 'RobotoMono'),
                          ),
                        ],
                      ),
                    )),

              ],
            ),
          ),
          // Steering Wheel
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: RotatingSteeringWheel(
                isActive: activeRide,
                onTap: () {
                  setState(() {
                    activeRide = !activeRide;
                    if (activeRide) {
                      CarController.startRide();
                      showRouteStartedNotification();
                    }
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

