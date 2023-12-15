import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';
import 'package:itu_cartrack/src/controller/user_controller.dart';
import 'package:itu_cartrack/src/model/car.dart';

class CarListScreen extends StatelessWidget {
  final UserController userController = UserController();
  final CarController carController = CarController();

  CarListScreen();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
            title: Text('Car List', style: TextStyle(color: theme.colorScheme.onSecondary),),
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
                return CarTitle(cars, index, context, theme);
              },
            );
          }
        },
      ),
      floatingActionButton: AddCarButton(),
    );
  }

  Container CarTitle(
      List<Car> cars, int index, BuildContext context, ThemeData theme) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      ),
      child: ListTile(
        leading: Icon(Icons.directions_car_filled_rounded,
            color: theme.colorScheme.secondary, size: 36.0),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cars[index].name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: theme.colorScheme
                    .onSecondaryContainer, // set text color to match background
              ),
            ),
            Text(
              cars[index].licensePlate,
              style: TextStyle(
                fontSize: 14.0,
                color: theme.colorScheme
                    .onSecondaryContainer, // set text color to match background
              ),
            ),
          ],
        ),
        onTap: () {
          carController.setActiveCar(cars[index]);
          Navigator.pushNamed(context, '/car-navigation');
        },
        trailing: IconButton(
          icon: Icon(Icons.favorite_outline, size: 28.0),
          color: theme.colorScheme.primary,
          // color: isFavorite
          //     ? Colors.pink
          //     : Colors
          //         .grey, // Set favorite icon color based on condition
          onPressed: () {
            // Toggle the favorite status or perform your favorite logic
            // setState(() {
            //   isFavorite = !isFavorite;
            // });
          },
        ),
      ),
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
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Name *'),
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
                      decoration: InputDecoration(labelText: 'License Plate *'),
                    ),
                    TextField(
                      controller: insuranceContactController,
                      decoration:
                          InputDecoration(labelText: 'Insurance Contact *'),
                    ),
                    TextField(
                      controller: odometerStatusController,
                      decoration:
                          InputDecoration(labelText: 'Odometer Status *'),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(labelText: 'Description'),
                    ),
                  ],
                ),
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
                    final odometerStatus = odometerStatusController.text.trim();
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Car ${name} Created'),
                        ),
                      );
                      Navigator.of(context).pop();
                    } else {
                      _showCustomSnackBar(context);
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

  void _showCustomSnackBar(BuildContext context) {
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height *
            0.8, // Adjust the position as needed
        width: MediaQuery.of(context).size.width,
        child: Material(
          color: Colors.transparent,
          child: Container(
            alignment: Alignment.center,
            child: Card(
              elevation: 10.0, // Adjust the elevation as needed
              color: Theme.of(context).colorScheme.secondary,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Please fill out all fields',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(Duration(seconds: 2), () {
      overlayEntry.remove();
    });
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
