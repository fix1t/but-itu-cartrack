import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/controller/login_controller.dart';
import 'package:itu_cartrack/src/controller/user_controller.dart';
import 'package:itu_cartrack/src/model/user.dart';

class LoginScreen extends StatelessWidget {
  final UserController userController = UserController();
  // Sample list for dropdown items, replace it with your data
  final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];

  // Variable to store the selected dropdown value
  String selectedDropdownValue = 'Option 1';
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
                  children: [
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
               SizedBox(height: 64.0),
              UserDropdown(userController),
              SizedBox(height: 16.0), // Adding some space between the input field and the button
              ElevatedButton(
                onPressed: () {
                  LoginController().handleLoginPressed(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16.0), // Making the button bigger
                ),
                child: Text(
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
          }

          return DropdownButton<String>(
            value: selectedUser,
            onChanged: (String? newValue) {
              setState(() {
                selectedUser = newValue;
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