import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:itu_cartrack/src/controller/login_controller.dart';
import 'package:itu_cartrack/src/widgets/theme_provider.dart';

class UserDetailScreen extends StatelessWidget {
  UserDetailScreen();

  @override
  Widget build(BuildContext context) {
    final user = LoginController().getCurrentUser();
    final ThemeData theme = Theme.of(context);

    // Function to change the theme color
    void changeColor(Color color) {
      // Access the ThemeProvider and set the new color scheme
      Provider.of<ThemeProvider>(context, listen: false).updateTheme(
        ColorScheme.fromSeed(seedColor: color),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('User Detail Screen', style: TextStyle(color: theme.colorScheme.onSecondary)),
        backgroundColor: theme.colorScheme.primary,
      ),
      body: user == null
          ? Center(child: Text('No user logged in'))
          : ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          // Color palette picker
          SizedBox(height: 24), // Space between color picker and details
          Text('Choose Theme:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 24),
          Wrap(
            children: List<Widget>.generate(
              Colors.primaries.length,
                  (index) {
                return GestureDetector(
                  onTap: () => changeColor(Colors.primaries[index]),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.primaries[index],
                      radius: 20,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 60), // Space between color picker and details
          Text('Profile details:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 24), // Space between color picker and details
          Text('Name: ${user.name}', style: TextStyle(fontSize: 20)),
          SizedBox(height: 8),
          Text('Login: ${user.login}', style: TextStyle(fontSize: 20)),
          SizedBox(height: 8),
          Text('Email: ${user.email}', style: TextStyle(fontSize: 20)),
          SizedBox(height: 8),
          Text('Phone: ${user.phoneNumber}', style: TextStyle(fontSize: 20)),
          // Add more user detail widgets here
        ],
      ),
    );
  }
}
