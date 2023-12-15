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
  bool isEditing = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController aliasController = TextEditingController();
  TextEditingController licensePlateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = activeCar.name;
    aliasController.text = activeCar.alias;
    licensePlateController.text = activeCar.licensePlate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Car Name'),
            ),
            TextFormField(
              controller: aliasController,
              decoration: InputDecoration(labelText: 'Car Alias'),
            ),
            TextFormField(
              controller: licensePlateController,
              decoration: InputDecoration(labelText: 'Car License Plate'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      //CarController.updateCar(activeCar.id, nameController.text, aliasController.text, licensePlateController.text);
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
                  child: Text('Delete Car'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
