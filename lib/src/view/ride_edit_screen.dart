import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';
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
  late TextEditingController _userNameController;

  DateTime? _selectedStartDateTime;
  DateTime? _selectedFinishDateTime;

  RideType? _selectedRideType;

  @override
  void initState() {
    super.initState();
    _rideTypeController = TextEditingController(text: widget.ride.rideType);
    _distanceController =
        TextEditingController(text: widget.ride.distance.toString());
    _userNameController = TextEditingController(text: widget.ride.userName);

    _selectedStartDateTime = widget.ride.startedAt;
    _selectedFinishDateTime = widget.ride.finishedAt;

    _selectedRideType = stringToRideType(widget.ride.rideType);
  }

  @override
  void dispose() {
    _rideTypeController.dispose();
    _distanceController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  void saveOrUpdateRide() {
    // Check if both start and finish times are selected
    if (!isValidTime() || !isValidDistance()) {
      return;
    }

    bool distanceChanged =
        _distanceController.text != widget.ride.distance.toString();
    print(distanceChanged);

    if (distanceChanged && widget.ride.id.isNotEmpty) {
      print('distance changed -> show dialog');
      Future.delayed(Duration.zero, () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Confirmation'),
              content: Text(
                  'Changing the distance will impact other rides. Are you sure to proceed?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    CarController.saveOrUpdateRide(createUpdatedRide());
                    Navigator.pop(context);
                    showSnackBar(context, 'Ride saved');
                  },
                  child: Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No'),
                ),
              ],
            );
          },
        );
      });
    } else {
      CarController.saveOrUpdateRide(createUpdatedRide());
      showSnackBar(context, 'Ride saved');
    }
  }

  Future<void> _selectDateTime(
      BuildContext context, bool isStartDateTime) async {
    final initialDate =
        isStartDateTime ? _selectedStartDateTime : _selectedFinishDateTime;
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (selectedDate != null) {
      final initialTime =
          isStartDateTime ? _selectedStartDateTime : _selectedFinishDateTime;
      final selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialTime ?? DateTime.now()),
      );
      if (selectedTime != null) {
        final selectedDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );
        setState(() {
          if (isStartDateTime) {
            _selectedStartDateTime = selectedDateTime;
          } else {
            _selectedFinishDateTime = selectedDateTime;
          }
        });
      }
    }
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
            Text(
              'Driver: ${widget.ride.userName}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<RideType>(
              value: _selectedRideType,
              // Set the default value or the value from your model
              decoration: InputDecoration(labelText: 'Ride Type'),
              items: RideType.values.map((type) {
                return DropdownMenuItem<RideType>(
                  value: type,
                  child: Text(type.toString().split('.').last),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedRideType = value;
                  _rideTypeController.text = value.toString().split('.').last;
                });
              },
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
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                      'Start\n${_selectedStartDateTime != null ? DateFormat('dd.MM - HH:mm').format(_selectedStartDateTime!) : ''}',
                    ),
                    onTap: () => _selectDateTime(context, true),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      'Finish\n${_selectedFinishDateTime != null ? DateFormat('dd.MM - HH:mm').format(_selectedFinishDateTime!) : ''}',
                    ),
                    onTap: () => _selectDateTime(context, false),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    saveOrUpdateRide();
                  },
                  child: Text('Save'),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    CarController.deleteRide(widget.ride);
                    Navigator.pop(context);
                    //displaySnackBar(context, 'Ride deleted');
                    showSnackBar(context, 'Ride deleted');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.error.withOpacity(0.8)),
                  child: Text(
                    'Delete',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.onError),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String s) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(s),
        duration: Duration(milliseconds: 1000),
      ),
    );
  }

  Ride createUpdatedRide() {
    Ride updatedRide = Ride(
      id: widget.ride.id,
      userId: widget.ride.userId,
      userName: widget.ride.userName,
      startedAt: _selectedStartDateTime ?? widget.ride.startedAt,
      finishedAt: _selectedFinishDateTime ?? widget.ride.finishedAt,
      rideType: _rideTypeController.text,
      distance: int.parse(_distanceController.text),
    );
    return updatedRide;
  }

  bool isValidTime() {
    if (_selectedStartDateTime != null && _selectedFinishDateTime != null) {
      // Check if the start time is greater than the finish time or vice versa
      if (_selectedStartDateTime!.isAfter(_selectedFinishDateTime!) ||
          _selectedFinishDateTime!.isBefore(_selectedStartDateTime!)) {
        // Show error dialog if the selected times are invalid
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Invalid Time Selection'),
              content: Text('Please select valid start and finish times.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        return false;
      }
      return true;
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invalid Time Selection'),
          content: Text('Please select valid start and finish times.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    return false;
  }

  bool isValidDistance() {
    if (_distanceController.text.isNotEmpty &&
        int.parse(_distanceController.text) > 0) {
      return true;
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invalid Distance'),
          content: Text('Please enter a valid distance.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    return false;
  }
}
