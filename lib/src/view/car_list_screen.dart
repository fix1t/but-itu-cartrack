/// This file contains the CarListScreen widget which displays a list of cars
/// @author: Jakub Mikysek xmikys03 -- added all functionality except: functionality, that is related to setting favorite cars by specific user
/// @co-author: Adam Gabrys xgabry01 -- added functionality, that is related to setting favorite cars by specific user

import 'package:flutter/material.dart';
import '../model/user.dart';
import '../model/car.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';
import 'package:itu_cartrack/src/controller/user_controller.dart';
import 'package:itu_cartrack/src/controller/login_controller.dart';

class CarListScreen extends StatefulWidget {
  CarListScreen({Key? key}) : super(key: key);

  @override
  _CarListScreenState createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  final UserController userController = UserController();
  final CarController carController = CarController();
  User? currentUser;

  @override
  void initState() {
    super.initState();
  }

  void _toggleFavorite(String carId) async {
    currentUser = LoginController().getCurrentUser();
    if (currentUser != null) {
      if (userController.isFavoriteCar(currentUser!, carId)) {
        userController.removeFavoriteCar(currentUser!, carId);
      } else {
        userController.addFavoriteCar(currentUser!, carId);
      }
      await userController.updateUserFavorites(
          currentUser!.id, currentUser!.favoriteCars);
      setState(() {}); // Trigger a rebuild to update the UI
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    currentUser = LoginController().getCurrentUser();
    return Scaffold(
      appBar: AppBar(
        title: Text('Car List',
            style: TextStyle(color: theme.colorScheme.onSecondary)),
        backgroundColor: theme.colorScheme.secondary,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: theme.colorScheme.onSecondary),
            onPressed: () => Navigator.pushNamed(context, '/user/detail'),
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
            // Check which cars are favorites
            List<Car> favoriteCars = [];
            List<Car> otherCars = [];
            for (var car in cars) {
              if (currentUser != null &&
                  userController.isFavoriteCar(currentUser!, car.id)) {
                favoriteCars.add(car);
              } else {
                otherCars.add(car);
              }
            }
            // Combine lists so favorites are first
            List<Car> sortedCars = favoriteCars..addAll(otherCars);

            return ListView.builder(
              itemCount: sortedCars.length,
              itemBuilder: (context, index) {
                return _buildCarTile(sortedCars[index], context, theme);
              },
            );
          }
        },
      ),
      floatingActionButton: AddCarButton(),
    );
  }

  Widget _buildCarTile(Car car, BuildContext context, ThemeData theme) {
    currentUser = LoginController().getCurrentUser();
    bool isFavorite = currentUser != null &&
        userController.isFavoriteCar(currentUser!, car.id);
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: theme.colorScheme.primary),
      ),
      child: ListTile(
        leading: Icon(carController.getIconFromInt(car.icon), color: theme.colorScheme.secondary, size: 36.0),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(car.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: theme.colorScheme.onSecondaryContainer)),
            Text(car.licensePlate,
                style: TextStyle(
                    fontSize: 14.0,
                    color: theme.colorScheme.onSecondaryContainer)),
          ],
        ),
        onTap: () {
          carController.setActiveCar(car);
          Navigator.pushNamed(context, '/car-navigation');
        },
        trailing: IconButton(
          icon: isFavorite
              ? Icon(Icons.favorite, color: Colors.red)
              : Icon(Icons.favorite_border),
          onPressed: () => _toggleFavorite(car.id),
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
    var selectedCarIcon = 0;

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
                    InputDecorator(
                      decoration:
                          InputDecoration(labelText: 'Car Icon'),
                      child: Row(
                        children: [
                          Radio(
                            value: 0,
                            groupValue: selectedCarIcon,
                            onChanged: (value) {
                              setState(() {
                                selectedCarIcon = value as int;
                              });
                            },
                          ),
                          Icon(Icons.directions_car),
                          Radio(
                            value: 1,
                            groupValue: selectedCarIcon,
                            onChanged: (value) {
                              setState(() {
                                selectedCarIcon = value as int;
                              });
                            },
                          ),
                          Icon(Icons.directions_bus),
                          Radio(
                            value: 2,
                            groupValue: selectedCarIcon,
                            onChanged: (value) {
                              setState(() {
                                selectedCarIcon = value as int;
                              });
                            },
                          ),
                          Icon(Icons.local_shipping),
                        ],
                      ),
                    ),
                    TextField(
                      controller: licensePlateController,
                      decoration: InputDecoration(labelText: 'License Plate *'),
                    ),
                    TextField(
                      controller: insuranceContactController,
                      decoration:
                          InputDecoration(labelText: 'Insurance Contact Number *'),
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
                        selectedCarIcon
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
            0.8,
        width: MediaQuery.of(context).size.width,
        child: Material(
          color: Colors.transparent,
          child: Container(
            alignment: Alignment.center,
            child: Card(
              elevation: 10.0,
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
    return InputDecorator(
      decoration: const InputDecoration(
        labelText: 'Fuel Type',
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedFuelType,
          onChanged: onChanged,
          items: fuelTypes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
