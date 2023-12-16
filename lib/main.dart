import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:itu_cartrack/src/widgets/theme_provider.dart';
import 'package:itu_cartrack/src/controller/login_controller.dart';
import 'package:itu_cartrack/src/controller/user_controller.dart';
import 'package:itu_cartrack/src/model/ride.dart';
import 'package:itu_cartrack/src/model/user_model.dart';
import 'package:itu_cartrack/src/view/car_expense_detail_screen.dart';
import 'package:itu_cartrack/src/view/car_home_help_screen.dart';
import 'package:itu_cartrack/src/view/ride_edit_screen.dart';
import 'package:itu_cartrack/src/widgets/tab_manager.dart';
import 'package:itu_cartrack/src/view/car_detail_screen.dart';
import 'package:itu_cartrack/src/view/car_home_screen.dart';
import 'package:itu_cartrack/src/view/car_list_screen.dart';
import 'package:itu_cartrack/src/view/login_screen.dart';
import 'package:itu_cartrack/src/view/car_expense_screen.dart';
import 'package:itu_cartrack/src/widgets/car_navbar.dart';
import 'package:itu_cartrack/src/view/car_notes_screen.dart';
import 'package:itu_cartrack/src/view/user_detail_screen.dart';

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

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(
      ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue)),
    ),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Car Track',
      theme: themeProvider.themeData,
      initialRoute: '/login',
      routes: {
        '/': (context) => TabManager(),
        // car list
        '/car': (context) => CarListScreen(), // LIST of cars + mark favorite!

        '/login': (context) => LoginScreen(),
        // company link + choose user

        // '/user/list': (context) => UserListScreen(), // list of users ??? needed?
         '/user/detail': (context) => UserDetailScreen(), // show user details
        // '/user/edit': (context) => UserListScreen(), // edit user details + add user
        //
        // IMPLEMENT AS BOTTOM NAVIGATION BAR
        //
        '/car-navigation': (context) => CarNavigationBase(),
        '/car/home': (context) => CarHomeScreen(),  // car home screen
        '/car/detail': (context) => CarDetailScreen(), // show car details
        //
        '/car/expense': (context) => CarExpenseScreen(), // LIST of expenses
        '/car/expense/detail': (context) => CarExpenseDetailScreen(), // show expense details
        //
        '/car/notes': (context) => CarNotesScreen(), // list of notes + add note - chat like
        //
        // '/car/history': (context) => CarListScreen(), // LIST of rides
        // '/car/history/detail': (context) => CarListScreen(), // show ride detail ??? needed?
        '/car/history/detail': (context) {
          //arguments: RideDetailArguments(ride: ride),
          final ride = ModalRoute
              .of(context)!
              .settings
              .arguments as Ride;
          return RideEditScreen(ride: ride);
        },
        // edit ride details + add ride ??? needed?
        '/car/home/help': (context) => HelpCallPage(),
        // show help detail
      },
    );
  }
}
