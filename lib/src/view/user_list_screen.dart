/// This screen shows a list of users and allows the user to add and delete users.
/// @Author: Gabriel Biel xbielg00

import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/controller/user_controller.dart';
import 'package:itu_cartrack/src/model/user.dart';

class UserListScreen extends StatelessWidget {
  UserListScreen();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('User List', style: TextStyle(
          color: theme.colorScheme.onSecondary)),
        backgroundColor: theme.colorScheme.secondary,
      ),
      body: StreamBuilder<List<User>>(
        stream: UserController().users, // Assume UserController is a singleton
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No users found'));
          } else {
            List<User> users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index].name),
                  trailing: IconButton(
                    icon: Icon(Icons.delete_outline),
                    color: theme.colorScheme.primary,
                    onPressed: () {
                      UserController().deleteUser(users[index].id);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddUserDialog(context),
        child: Icon(Icons.add),
        heroTag: 'addUserFAB' //needs to be unique, just to cancel Exception with using the same heroes
      ),
    );
  }

  void _showAddUserDialog(BuildContext context) {
    final nameController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add User'),
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                if (name.isNotEmpty) {
                  UserController().addUser(name: name);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
