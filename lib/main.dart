// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';
import 'package:itu_cartrack/src/model/car_model.dart';
import 'package:itu_cartrack/src/tab_manager.dart';
import 'firebase_options.dart';
import 'package:itu_cartrack/src/model/user_model.dart';
import 'package:itu_cartrack/src/controller/user_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final databaseReference = FirebaseDatabase.instance.reference();
  final userModel = UserModel(databaseReference);
  final carModel = CarModel(databaseReference);
  final userController = UserController(userModel);
  final carController = CarController(carModel);
  runApp(MyApp(userController, carController));
}

class MyApp extends StatelessWidget {
  final UserController userController;
  final CarController carController;

  MyApp(this.userController, this.carController);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabManager(userController, carController),
    );
  }
}
