import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/model/user.dart';

class LoginController {
  // Private constructor for the Singleton pattern
  static User? currentUser;  // Global variable to store the current user
  LoginController._private();

  static final LoginController _instance = LoginController._private();

  factory LoginController() {
    return _instance;
  }

  void handleLoginPressed(BuildContext context, User? selectedUser) {
    currentUser = selectedUser;  // Storing the current user in the global variable

    Navigator.pop(context);
    log("Current Logged User: ${currentUser?.name ?? 'Unknown'}");
  }

  void logout(BuildContext context) {
    currentUser = null; // Reset the current user to null
    Navigator.pop(context);
    Navigator.of(context).pushNamed('/login'); // Navigate to login screen and remove all routes below
  }

  getActiveUser() {
    return currentUser;
  }
  User? getCurrentUser() {
    return currentUser;
  }
  String getCurrentUserId() {
    return currentUser!.id;
  }

  String getCurrentUserName() {
    return currentUser!.name;
  }
}
