import 'package:firebase_database/firebase_database.dart';
import 'package:itu_cartrack/src/model/user.dart';

class UserModel {
  final DatabaseReference databaseReference;

  UserModel(this.databaseReference);

  Future<void> addUser(String name) async {
    DatabaseReference userRef = databaseReference.child('users').push();
    await userRef.set({'name': name});
  }

  Future<void> deleteUser(String userId) async {
    await databaseReference.child('users').child(userId).remove();
  }

  Stream<List<User>> getUsers() {
    return databaseReference.child('users').onValue.map((event) {
      var snapshot = event.snapshot;
      var data = snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        List<User> users = [];
        data.forEach((key, value) {
          User user = User.fromMap(key, value);
          users.add(user);
        });
        return users;
      }
      return [];
    });
  }
}

