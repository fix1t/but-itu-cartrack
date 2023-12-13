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
        title: Text('Car List'),
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
                    Navigator.pushNamed(context, '/car/home', arguments: cars[index]);
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
    );
  }

  void _showAddCarDialog(BuildContext context) {
    final nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Car'),
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                if (name.isNotEmpty) {
                  carController.addCar(name);
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
