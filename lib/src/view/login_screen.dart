// Example of a LoginScreen widget
import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            LoginController().handleLoginPressed( context );
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
