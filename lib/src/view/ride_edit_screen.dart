import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/model/ride.dart';

class RideEditScreen extends StatefulWidget {
  final Ride ride;

  RideEditScreen({
    Key? key,
    required this.ride,
  }) : super(key: key);

  @override
  _RideEditScreenState createState() => _RideEditScreenState();
}

class _RideEditScreenState extends State<RideEditScreen> {
  late TextEditingController _rideTypeController;
  late TextEditingController _distanceController;


  @override
  void initState() {
    super.initState();
    _rideTypeController = TextEditingController(text: widget.ride.rideType);
    _distanceController = TextEditingController(text: widget.ride.distance.toString());
  }

  @override
  void dispose() {
    _rideTypeController.dispose();
    _distanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ride.id.isEmpty ? 'Create Ride' : 'Edit Ride'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _rideTypeController,
              decoration: InputDecoration(
                labelText: 'Ride Type',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _distanceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Distance (km)',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Save or update ride logic here
              },
              child: Text(widget.ride.id.isEmpty ? 'Create Ride' : 'Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
