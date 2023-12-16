import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';
import 'package:itu_cartrack/src/model/car.dart';
import 'package:itu_cartrack/src/model/ride.dart';
import 'package:itu_cartrack/src/widgets/steering_wheel.dart';

class CarHomeScreen extends StatefulWidget {
  CarHomeScreen();

  @override
  _CarHomeScreenState createState() => _CarHomeScreenState();
}

class _CarHomeScreenState extends State<CarHomeScreen> {
  Car selectedCar = CarController.activeCar;
  String odometer = CarController.activeCar.odometerStatus;
  DateTime? rideStartTime;
  bool activeRide = false;

  @override
  void initState() {
    super.initState();
    // Register the callback to update the selectedCar
    CarController.onOdometerChange = () {
      setState(() {
        selectedCar = CarController.activeCar;
      });
    };
  }

  @override
  void dispose() {
    CarController.onOdometerChange =
        null; // Unregister the callback to prevent memory leaks
    super.dispose();
  }

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
    String selectedRideType = 'Business'; // Variable to hold selected ride type
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
                        selectedRideType = value.toString().split('.').last;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      labelText: 'Odometer Status',
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorText: (int.parse(selectedCar.odometerStatus) >= odometerStatus)
                          ? 'New distance should be greater than current'
                          : null,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) {
                          odometerStatus = int.parse(value);
                        }
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(3), // Margin of 1px around the button
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                odometerStatus += 1;
                                textEditingController.text =
                                    odometerStatus.toString();
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 8,
                              ),
                            ),
                            child: Text('+1'),
                          ),
                        ),
                      ),
                          Expanded(
                        child: Container(
                          margin: EdgeInsets.all(3),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                odometerStatus += 5;
                                textEditingController.text =
                                    odometerStatus.toString();
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 8,
                              ),
                            ),
                            child: Text('+5'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(3),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                odometerStatus += 10;
                                textEditingController.text =
                                    odometerStatus.toString();
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 8,
                              ),
                            ),
                            child: Text('+10'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(3),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                odometerStatus += 50;
                                textEditingController.text =
                                    odometerStatus.toString();
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 8,
                              ),
                            ),
                            child: Text('+50'),
                          ),
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
                    if (CarController.isCorrectRideInput(
                        odometerStatus: odometerStatus,
                        rideType: selectedRideType)) {
                      setState(() {
                        odometer = CarController.activeCar.odometerStatus;
                        activeRide = false;
                      });
                      CarController.finishRide();
                      Navigator.of(context).pop(); // Close the dialog
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Please fill in all fields!'),
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
        title: Text(
          '${selectedCar.name}',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          // Car Name + License Plate + Icon
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${selectedCar.name}',
                        style: TextStyle(
                          fontSize: 28,
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  flex: 1,
                  child: Column(
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
                ),
              ],
            ),
          ),
          // Dashboard Image + Odometer Status
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            // padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // help button
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.error,
                      width: 2, // Adjust border width as needed
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.car_crash_rounded),
                    color: Theme.of(context).colorScheme.error,
                    iconSize: 40,
                    onPressed: () {
                      Navigator.pushNamed(context, '/car/home/help');
                    },
                  ),
                ),
                // odometer + odometer status
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage('assets/images/o2.png'),
                          fit: BoxFit.contain,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${selectedCar.odometerStatus}',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                              fontFamily: 'RobotoMono',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
