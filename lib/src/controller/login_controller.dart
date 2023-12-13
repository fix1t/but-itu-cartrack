import 'package:flutter/material.dart';

class LoginController {
  // Private constructor for the Singleton pattern
  LoginController._private();

  static final LoginController _instance = LoginController._private();

  factory LoginController() {
    return _instance;
  }

  void handleLoginPressed(BuildContext context) {
    // TODO: implement context switching for logged in user
    Navigator.pop(context);
  }
}
