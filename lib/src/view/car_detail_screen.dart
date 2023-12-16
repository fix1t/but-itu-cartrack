/// This file contains the screen for the car detail page.
/// @author: Jakub Mikysek xmikys03

import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';
import 'package:itu_cartrack/src/model/car.dart';

class CarDetailScreen extends StatefulWidget {
  @override
  _CarDetailScreenState createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen> {
  final CarController carController = CarController();
  Car activeCar = CarController.activeCar;
  TextEditingController nameController = TextEditingController();
  TextEditingController aliasController = TextEditingController();
  TextEditingController fuelTypeController = TextEditingController();
  TextEditingController licensePlateController = TextEditingController();
  TextEditingController insuranceController = TextEditingController();
  TextEditingController insuranceContactController = TextEditingController();
  TextEditingController odometerStatusController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = activeCar.name;
    aliasController.text = activeCar.alias;
    fuelTypeController.text = activeCar.fuelType;
    licensePlateController.text = activeCar.licensePlate;
    insuranceController.text = activeCar.insurance;
    insuranceContactController.text = activeCar.insuranceContact;
    odometerStatusController.text = activeCar.odometerStatus;
    descriptionController.text = activeCar.description;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Detail',
            style: TextStyle(color: theme.colorScheme.onPrimary)),
        backgroundColor: theme.colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Car Name'),
              ),
              TextFormField(
                controller: aliasController,
                decoration: InputDecoration(labelText: 'Car Alias'),
              ),
              DropdownButtonFormField<String>(
                value: fuelTypeController.text.isNotEmpty
                    ? fuelTypeController.text
                    : 'Gasoline', // anti null
                onChanged: (newValue) {
                  setState(() {
                    fuelTypeController.text = newValue!;
                  });
                },
                items: <String>[
                  'Gasoline',
                  'Diesel',
                  'Electric',
                  'Hybrid',
                  'LPG',
                  'CNG',
                  'Other'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Fuel Type'),
              ),
              TextFormField(
                controller: licensePlateController,
                decoration: InputDecoration(labelText: 'Car License Plate'),
              ),
              TextFormField(
                controller: insuranceController,
                decoration: InputDecoration(labelText: 'Insurance'),
              ),
              TextFormField(
                controller: insuranceContactController,
                decoration: InputDecoration(labelText: 'Insurance Contact'),
              ),
              TextFormField(
                controller: odometerStatusController,
                decoration: InputDecoration(labelText: 'Odometer Status (km)'),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        carController.updateCar(
                            activeCar.id,
                            nameController.text,
                            aliasController.text,
                            fuelTypeController.text,
                            licensePlateController.text,
                            insuranceController.text,
                            insuranceContactController.text,
                            odometerStatusController.text,
                            descriptionController.text);
                      });
                    },
                    child: Text('Update Car Info'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            //backgroundColor: Theme.of(context).colorScheme.error.withOpacity(0.8),
                            title: Text('Are you sure?'),
                            content: Text('Do you want to delete this car?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    carController.deleteCar(activeCar.id);
                                  });
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                                child: Text('Delete'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .error
                            .withOpacity(0.8)),
                    child: Text('Delete Car',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onError)),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.13)
            ],
          ),
        ),
      ),
    );
  }
}
