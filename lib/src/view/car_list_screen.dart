import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';
import 'package:itu_cartrack/src/controller/user_controller.dart';
import 'package:itu_cartrack/src/model/car.dart';

class CarListScreen extends StatelessWidget {
  final UserController userController = UserController();
  final CarController carController = CarController();
  final TextEditingController _nameController = TextEditingController();

  CarListScreen();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Car List', style: TextStyle(
          color: theme.colorScheme.onSecondary)),
        backgroundColor: theme.colorScheme.secondary,
      ),
      body: StreamBuilder<List<Car>>(
        stream: carController.cars,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No cars found'));
          } else {
            List<Car> cars = snapshot.data!;
            return ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cars[index].name),
                  onTap: () {
                    carController.setActiveCar(cars[index]);
                    Navigator.pushNamed(context, '/car-navigation');
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete_outline),
                    color: theme.colorScheme.primary,
                    onPressed: () {
                      carController.deleteCar(cars[index].id);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: AddCarButton(),
    );
  }
}

class AddCarButton extends StatelessWidget {
  AddCarButton({Key? key}) : super(key: key);

  final CarController carController = CarController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showAddCarDialog(context),
      child: Icon(Icons.add),
      heroTag: 'addCarFAB'    //needs to be unique, just to cancel Exception with using the same heroes
    );
  }

  void _showAddCarDialog(BuildContext context) {
    final nameController = TextEditingController();
    final fuelTypeController = TextEditingController();
    final licensePlateController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Car'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: fuelTypeController,
                decoration: InputDecoration(labelText: 'Fuel Type'),
              ),
              TextField(
                controller: licensePlateController,
                decoration: InputDecoration(labelText: 'License Plate'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                final fuelType = fuelTypeController.text.trim();
                final licensePlate = licensePlateController.text.trim();
                if (name.isNotEmpty && fuelType.isNotEmpty && licensePlate.isNotEmpty) {
                  carController.addCar(name, fuelType, licensePlate);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
