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
            actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.settings, color: theme.colorScheme.onSecondary),
                    onPressed: () {
                      // Navigate to UserDetailScreen when the button is pressed
                      Navigator.pushNamed(context, '/user/detail');
                    },
                ),
            ],
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

class AddCarButton extends StatefulWidget {
  AddCarButton({Key? key}) : super(key: key);

  @override
  _AddCarButtonState createState() => _AddCarButtonState();
}

class _AddCarButtonState extends State<AddCarButton> {
  final CarController carController = CarController();
  final List<String> fuelTypes = [
    'Gasoline',
    'Diesel',
    'Electric',
    'Hybrid',
    'LPG',
    'CNG',
    'Other'
  ];
  String selectedFuelType = 'Gasoline';

  @override
    Widget build(BuildContext context) {
      return FloatingActionButton(
        onPressed: () => _showAddCarDialog(context),
        child: Icon(Icons.add),
        heroTag: 'addCarFAB',
      );
    }

    void _showAddCarDialog(BuildContext context) {
      final nameController = TextEditingController();
      final aliasController = TextEditingController();
      final licensePlateController = TextEditingController();
      final insuranceContactController = TextEditingController();
      final odometerStatusController = TextEditingController();
      final descriptionController = TextEditingController();

      showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
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
                      controller: aliasController,
                      decoration: InputDecoration(labelText: 'Alias'),
                    ),
                    FuelTypeDropdown(
                      selectedFuelType: selectedFuelType,
                      fuelTypes: fuelTypes,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedFuelType = newValue!;
                        });
                      },
                    ),
                    TextField(
                      controller: licensePlateController,
                      decoration: InputDecoration(labelText: 'License Plate'),
                    ),
                    TextField(
                      controller: insuranceContactController,
                      decoration: InputDecoration(labelText: 'Insurance Contact'),
                    ),
                    TextField(
                      controller: odometerStatusController,
                      decoration: InputDecoration(labelText: 'Odometer Status'),
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(labelText: 'Description'),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      final name = nameController.text.trim();
                      final alias = aliasController.text.trim();
                      final fuelType = selectedFuelType;
                      final licensePlate = licensePlateController.text.trim();
                      final insuranceContact =
                          insuranceContactController.text.trim();
                      final odometerStatus =
                          odometerStatusController.text.trim();
                      final description = descriptionController.text.trim();
                      if (name.isNotEmpty &&
                          fuelType.isNotEmpty &&
                          licensePlate.isNotEmpty &&
                          insuranceContact.isNotEmpty &&
                          odometerStatus.isNotEmpty) {
                        carController.addCar(
                          name,
                          alias,
                          fuelType,
                          licensePlate,
                          insuranceContact,
                          odometerStatus,
                          description,
                        );
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              );
            },
          );
        },
      );
    }
  }

class FuelTypeDropdown extends StatelessWidget {
  final String selectedFuelType;
  final List<String> fuelTypes;
  final ValueChanged<String?> onChanged;

  const FuelTypeDropdown({
    required this.selectedFuelType,
    required this.fuelTypes,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Set width to full width
      child: DropdownButton<String>(
        hint: const Text('Select fuel type for the car'),
        value: selectedFuelType,
        onChanged: onChanged,
        items: fuelTypes.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
