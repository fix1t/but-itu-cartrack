import 'package:firebase_database/firebase_database.dart';

class UserModel {
  final DatabaseReference databaseReference;

  UserModel(this.databaseReference);

  Future<void> addUser(String name) async {
    DatabaseReference userRef = databaseReference.child('users').push();
    await userRef.set({'name': name});  // Use the input to create a new user
  }

  Stream<List<User>> getUsers() {
    return databaseReference.child('users').onValue.map((event) {
      var snapshot = event.snapshot;
      var data = snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        List<User> users = [];
        data.forEach((key, value) {
          User user = User.fromMap(value);
          users.add(user);
        });
        return users;
      }
      return [];
    });
  }
}

class User {
  final String name;

  User(this.name);

  static User fromMap(Map<dynamic, dynamic> map) {
    return User(map['name']);
  }
}
