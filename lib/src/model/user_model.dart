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

  // Update the favorite cars for a user in the database
  Future<void> updateUserFavorites(String userId, List<String> favoriteCars) async {
    await databaseReference.child('users').child(userId).update({'favoriteCars': favoriteCars});
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
}
