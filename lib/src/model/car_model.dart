import 'package:firebase_database/firebase_database.dart';

class CarModel {
  final DatabaseReference databaseReference;

  CarModel(this.databaseReference);

  Future<void> addCar(String name) async {
    DatabaseReference userRef = databaseReference.child('cars').push();
    await userRef.set({'name': name});  // Use the input to create a new user
  }

  Stream<List<Car>> getCars() {
    return databaseReference.child('cars').onValue.map((event) {
      var snapshot = event.snapshot;
      var data = snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        List<Car> users = [];
        data.forEach((key, value) {
          Car user = Car.fromMap(value);
          users.add(user);
        });
        return users;
      }
      return [];
    });
  }
}

class Car {
  final String name;

  Car(this.name);

  static Car fromMap(Map<dynamic, dynamic> map) {
    return Car(map['name']);
  }
}
