import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserList(),
    );
  }
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final databaseReference = FirebaseDatabase.instance.reference();
  List<Map<dynamic, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    databaseReference.child('users').onValue.listen((event) {
      var snapshot = event.snapshot;
      var data = snapshot.value as Map<dynamic, dynamic>;
      if (data != null) {
        List<Map<dynamic, dynamic>> list = [];
        data.forEach((key, value) {
          Map<dynamic, dynamic> user = Map<dynamic, dynamic>.from(value);
          list.add(user);
        });
        setState(() {
          users = list;
        });
      }
    });
  }

  Future<void> createUser(String name) async {
    final id = databaseReference.child('users').push().key;
    await databaseReference.child('users').child(id!).set({'name': name});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: users.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user['name']),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
                        createUser(name);
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
