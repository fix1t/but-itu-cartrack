import 'package:firebase_database/firebase_database.dart';
import 'package:itu_cartrack/src/model/user.dart';

class UserModel {
  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  UserModel();

  Future<void> addUser(User user) async {
    DatabaseReference userRef = databaseReference.child('users').push();
    await userRef.set(user.toMap());
  }

  Future<void> deleteUser(String userId) async {
    await databaseReference.child('users').child(userId).remove();
  }


  Stream<List<User>> getUsers() {
    return databaseReference.child('users').onValue.map((event) {
      var snapshot = event.snapshot;
      var data = snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        List<User> userList = [];
        data.forEach((key, value) {
          if (value is Map<Object?, Object?>) {
              userList.add(User.fromMap(key, value.cast<String, dynamic>()));
          }
        });
        return userList;
      }
      return [];
    });
  }

  // Stream<User?> getUserById(String userId) {
  //   return databaseReference.child('users').child(userId).onValue.map((event) {
  //     var snapshot = event.snapshot;
  //     var data = snapshot.value as Map<dynamic, dynamic>?;

  //     if (data != null) {
  //       // Check if the user with the provided ID exists
  //       if (data.containsKey(userId) && data[userId] is Map<Object?, Object?>) {
  //         return User.fromMap(userId, data[userId].cast<String, dynamic>());
  //       }
  //     }
  //     return null; // Return null if the user with the provided ID doesn't exist
  //   });
  // }
}
