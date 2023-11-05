// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';
import 'package:itu_cartrack/src/model/user_model.dart';
import 'package:itu_cartrack/src/view/user_view.dart';
import 'package:itu_cartrack/src/controller/user_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final databaseReference = FirebaseDatabase.instance.reference();
  final userModel = UserModel(databaseReference);
  final userController = UserController(userModel);
  runApp(MyApp(userController));
}

class MyApp extends StatelessWidget {
  final UserController userController;

  MyApp(this.userController);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserView(userController),
    );
  }
}
