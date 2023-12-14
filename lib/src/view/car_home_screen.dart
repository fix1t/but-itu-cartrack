import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';
import 'package:itu_cartrack/src/controller/login_controller.dart';
import 'package:itu_cartrack/src/model/car.dart';
import 'package:itu_cartrack/src/model/ride.dart';
import 'package:itu_cartrack/src/widgets/steering_wheel.dart';

class CarHomeScreen extends StatefulWidget {
  CarHomeScreen();

  @override
  _CarHomeScreenState createState() => _CarHomeScreenState();
}

class _CarHomeScreenState extends State<CarHomeScreen> {
  final Car selectedCar = CarController.activeCar;
  DateTime? rideStartTime;
  bool activeRide = false;

  void showRouteStartedNotification() {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Your route has been started!'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                activeRide = false;
              });
            },
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.zero,
        ),
    );
  }

  void showFinishRideDialog() {
    String selectedRideType = ''; // Variable to hold selected ride type
    int odometerStatus = int.parse(selectedCar.odometerStatus);
    TextEditingController textEditingController =
    TextEditingController(text: odometerStatus.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('One last thing...'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  DropdownButtonFormField<RideType>(
                    value: RideType.Business,
                    decoration: InputDecoration(labelText: 'Ride Type'),
                    items: RideType.values.map((type) {
                      return DropdownMenuItem<RideType>(
                        value: type,
                        child: Text(type.toString().split('.').last),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedRideType = value.toString();
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(labelText: 'Odometer Status'),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        odometerStatus = int.parse(value);
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              odometerStatus += 1;
                              textEditingController.text = odometerStatus.toString();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8), // Adjust the padding here
                          ),
                          child: Text('+1'),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              odometerStatus += 5;
                              textEditingController.text = odometerStatus.toString();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8), // Adjust the padding here
                          ),
                          child: Text('+5'),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              odometerStatus += 10;
                              textEditingController.text = odometerStatus.toString();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8), // Adjust the padding here
                          ),
                          child: Text('+10'),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              odometerStatus += 50;
                              textEditingController.text = odometerStatus.toString();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8), // Adjust the padding here
                          ),
                          child: Text('+50'),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Cancel Ride'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (odometerStatus > int.parse(selectedCar.odometerStatus) &&
                        selectedRideType.isNotEmpty) {
                      // Handle finish ride logic here
                      // Create a new Ride object or update the current ride
                      Ride finishedRide = Ride(
                        userId: LoginController.currentUser!.id,
                        startedAt: CarController.activeRide.startedAt,
                        finishedAt: DateTime.now(),
                        rideType: selectedRideType,
                        distance: 0, // Set distance as needed
                      );

                      // Close the dialog and update the activeRide status
                      Navigator.of(context).pop();
                      setState(() {
                        activeRide = false;
                        // Process finishedRide...
                      });
                    }
                  },
                  child: Text('Add Ride'),
                ),
              ],
            );
          },
        );
      },
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
                        Navigator.pushNamed(context, '/car/home/help');
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
                            '${selectedCar.odometerStatus}',
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
                    )
                ),
              ],
            ),
          ),
          // Steering Wheel
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
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
                    } else {
                      showFinishRideDialog();
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
