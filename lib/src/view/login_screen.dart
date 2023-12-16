/// This file contains the LoginScreen widget, which is the first screen that the user sees.
/// The user can select a user from the dropdown and then press the login button to continue.
/// @author: Jakub Mikysek xmikys03

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/controller/login_controller.dart';
import 'package:itu_cartrack/src/controller/user_controller.dart';
import 'package:itu_cartrack/src/model/user.dart';

User? currentUser;  // Global variable to store the current user

class LoginScreen extends StatelessWidget {
  final UserController userController = UserController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: const [
                    TextSpan(
                      text: 'CAR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    TextSpan(
                      text: 'TRACK',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 64.0),
              UserDropdown(userController),
              const SizedBox(height: 16.0), // Adding some space between the input field and the button
              ElevatedButton(
                onPressed: () {
                  LoginController().handleLoginPressed(context, currentUser);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16.0), // Making the button bigger
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 18.0, // Increasing the font size
                    fontWeight: FontWeight.bold, // Making the text bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserDropdown extends StatefulWidget {
  final UserController userController;

  UserDropdown(this.userController);

  @override
  _UserDropdownState createState() => _UserDropdownState();
}

class _UserDropdownState extends State<UserDropdown> {
  String? selectedUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<User>>(
      stream: widget.userController.users,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasData && snapshot.data != null) {
          List<User> users = snapshot.data!;
          if (selectedUser == null && users.isNotEmpty) {
            selectedUser = users[0].name; // Initialize with the first user's name
            currentUser = users[0];       // Initialize with the first user
          }
          log("Selected User: ${currentUser?.name ?? 'Unknown'}"); 

          return DropdownButton<String>(
            value: selectedUser,
            onChanged: (String? newValue) {
              setState(() {
                selectedUser = newValue;
                currentUser = users.firstWhere((user) => user.name == newValue); // Update currentUser
              });
            },
            items: users.map<DropdownMenuItem<String>>((User user) {
              return DropdownMenuItem<String>(
                value: user.name,
                child: Text(user.name),
              );
            }).toList(),
          );
        } else {
          return Text('No users available');
        }
      },
    );
  }
}