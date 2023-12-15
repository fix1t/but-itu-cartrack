import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';
import 'package:itu_cartrack/src/controller/login_controller.dart';
import 'package:itu_cartrack/src/model/ride.dart';

class CarHistoryScreen extends StatelessWidget {
  final CarController carController = CarController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Car History',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        backgroundColor: theme.colorScheme.secondary,
      ),
      body: StreamBuilder<List<Ride>>(
        stream: carController.getActiveCarRides(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No ride history found'));
          } else {
            List<Ride> rides = snapshot.data!;
            return ListView.builder(
              itemCount: rides.length,
              itemBuilder: (context, index) {
                String formattedDate =
                    '${rides[index].finishedAt.day.toString().padLeft(2, '0')}.${rides[index].finishedAt.month.toString().padLeft(2, '0')}.${rides[index].finishedAt.year.toString().substring(2)}';
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '$formattedDate',
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${rides[index].userName}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${rides[index].distance} km',
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Implement the logic to show the ride details
                    Navigator.pushNamed(
                      context,
                      '/car/history/detail',
                      arguments: rides[index],

                    );
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: AddRideButton(),
    );
  }
}

class AddRideButton extends StatelessWidget {
  AddRideButton({Key? key}) : super(key: key);

  final CarController carController = CarController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Implement the logic to add a new ride
        Navigator.pushNamed(
          context,
          '/car/history/detail',
          arguments: Ride(userId: LoginController().getActiveUser().id, userName: LoginController().getActiveUser().name),
        );
      },
      child: Icon(Icons.add),
      heroTag:
          'addRideFAB', // Needs to be unique, just to cancel Exception with using the same heroes
    );
  }
}
