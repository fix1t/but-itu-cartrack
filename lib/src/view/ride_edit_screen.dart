import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';
import 'package:itu_cartrack/src/model/car.dart';
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
  bool updateOdometer = false;
  int initialDistance = 0;

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

    initialDistance = widget.ride.distance;
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
      if (updateOdometer) {
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
                      CarController.saveOrUpdateRide(createUpdatedRide(),
                          odometerStatusChange: int.parse(_distanceController.text) - initialDistance);
                      Navigator.pop(context);
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
        Navigator.pop(context);
        showSnackBar(context, 'Ride saved');
      }
    } else {
      if(updateOdometer){
        CarController.saveOrUpdateRide(createUpdatedRide(),
            odometerStatusChange: int.parse(_distanceController.text) - initialDistance);
      } else {
        CarController.saveOrUpdateRide(createUpdatedRide());
      }
      Navigator.pop(context);
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
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ride.id.isEmpty ? 'Create Ride' : 'Edit Ride',
        style: TextStyle(color: theme.colorScheme.onSecondary)
        ),
        backgroundColor: theme.colorScheme.secondary,
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
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey, // Choose your border color
                        width: 1, // Set border width
                      ),
                      borderRadius: BorderRadius.circular(
                          8), // Adjust border radius as needed
                    ),
                    child: ListTile(
                      title: Text(
                        'Started at\n${_selectedStartDateTime != null ? DateFormat('dd.MM - HH:mm').format(_selectedStartDateTime!) : ''}',
                      ),
                      onTap: () => _selectDateTime(context, true),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey, // Choose your border color
                        width: 1, // Set border width
                      ),
                      borderRadius: BorderRadius.circular(
                          8), // Adjust border radius as needed
                    ),
                    child: ListTile(
                      title: Text(
                        'Finished at\n${_selectedFinishDateTime != null ? DateFormat('dd.MM - HH:mm').format(_selectedStartDateTime!) : ''}',
                      ),
                      onTap: () => _selectDateTime(context, false),
                    ),
                  ),
                ),
              ],
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
              decoration: InputDecoration(
                labelText: 'Distance (km)',
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorText: (_distanceController.text.isNotEmpty ? int.parse(_distanceController.text) <= 0 : true )
                    ? 'New distance should be greater than current'
                    : null,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (value) {
                setState(() {
                  _distanceController.text = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            SwitchListTile(
              title: Text('Update Odometer'),
              subtitle: Text('Toggle to update odometer status'),
              value: updateOdometer,
              onChanged: (value) {
                setState(() {
                  updateOdometer = value;
                });
              },
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
                    CarController.deleteRide(widget.ride, updateOdo: updateOdometer);
                    Navigator.pop(context);
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
            ),
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
    try {
      int distance = int.parse(_distanceController.text);
      if (distance > 0) {
        return true;
      }
    } catch (e) {
      _distanceController.text = '0';
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
