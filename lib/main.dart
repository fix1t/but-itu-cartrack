import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/controller/login_controller.dart';
import 'package:itu_cartrack/src/controller/user_controller.dart';
import 'package:itu_cartrack/src/model/car.dart';
import 'package:itu_cartrack/src/model/user_model.dart';
import 'package:itu_cartrack/src/widgets/tab_manager.dart';
import 'package:itu_cartrack/src/view/car_detail.dart';
import 'package:itu_cartrack/src/view/car_home_screen.dart';
import 'package:itu_cartrack/src/view/car_list_screen.dart';
import 'package:itu_cartrack/src/view/login_screen.dart';
import 'package:itu_cartrack/src/view/user_list_screen.dart';
import 'package:itu_cartrack/src/view/car_expense.dart';
import 'package:itu_cartrack/src/widgets/car_navbar.dart';
import 'package:itu_cartrack/src/view/car_notes_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Instantiate UserModel
  final UserModel userModel = UserModel();

  // Instantiate Controllers as Singletons
  final UserController userController = UserController();
  final LoginController loginController = LoginController();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Track',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue)),
      initialRoute: '/login',
      routes: {
        '/': (context) => TabManager(), // car list

        '/login': (context) => LoginScreen(), // company link + choose user

        // '/user/list': (context) => UserListScreen(), // list of users ??? needed?
        // '/user/detail': (context) => UserListScreen(), // show user details
        // '/user/edit': (context) => UserListScreen(), // edit user details + add user
        //
        '/car': (context) => CarListScreen(), // LIST of cars + mark favorite!

        // IMPLEMENT AS BOTTOM NAVIGATION BAR
        //
        '/car-navigation': (context) => CarNavigationBase(),
        '/car/home': (context) => CarHomeScreen(),  // car home screen
        '/car/detail': (context) => CarDetailScreen(), // show car details
        // '/car/detail/edit': (context) => CarListScreen(), // edit car details + add car
        //
         '/car/expense': (context) => CarExpenseScreen(), // LIST of expenses
        // '/car/expense/detail': (context) => CarListScreen(), // show expense details
        // '/car/expense/detail/edit': (context) => CarListScreen(), // edit expense details + add expense
        //
        '/car/notes': (context) => CarNotesScreen(), // list of notes + add note - chat like
        //
        // '/car/history': (context) => CarListScreen(), // LIST of rides
        // '/car/history/detail': (context) => CarListScreen(), // show ride detail ??? needed?
        // '/car/history/detail/edit': (context) => CarListScreen(), // edit ride details + add ride ??? needed?
        //
        // '/car/home/help': (context) => CarListScreen(), // show help detail
      },
    );
  }
}
