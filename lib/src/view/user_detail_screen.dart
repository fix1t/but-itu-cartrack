///Screen for displaying current user details and changing theme color throughout the app, also allows user logging out
///@Author: Adam Gabrys xgabry01
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
        title: Text('User Detail',
            style: TextStyle(color: theme.colorScheme.onSecondary)),
        backgroundColor: theme.colorScheme.primary,
      ),
      body: user == null
          ? Center(child: Text('No user logged in'))
          : ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                // Color palette picker
                SizedBox(height: 24), // Space between color picker and details
                Text('Choose Theme:',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
                Text('Profile details:',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 30), // Space between title and details
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 22, color: Colors.black),
                    // Default text style
                    children: <TextSpan>[
                      TextSpan(text: 'Name: '),
                      TextSpan(
                          text: '${user.name}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 22, color: Colors.black),
                    // Default text style
                    children: <TextSpan>[
                      TextSpan(text: 'Login: '),
                      TextSpan(
                          text: '${user.login}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 22, color: Colors.black),
                    // Default text style
                    children: <TextSpan>[
                      TextSpan(text: 'Email: '),
                      TextSpan(
                          text: '${user.email}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 22, color: Colors.black),
                    // Default text style
                    children: <TextSpan>[
                      TextSpan(text: 'Phone: '),
                      TextSpan(
                          text: '${user.phoneNumber}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    LoginController().logout(context);
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.error.withOpacity(0.8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: Text('Logout',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onError)),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ],
            ),
    );
  }
}
