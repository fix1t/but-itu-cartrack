import 'package:firebase_database/firebase_database.dart';
import 'package:itu_cartrack/src/model/car.dart';

class CarModel {
  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  CarModel();

  Future<void> addCar(String name) async {
    DatabaseReference userRef = databaseReference.child('cars').push();
    await userRef.set({'name': name});
  }

  Future<void> deleteCar(String userId) async {
    await databaseReference.child('cars').child(userId).remove();
  }

  Stream<List<Car>> getCars() {
    return databaseReference.child('cars').onValue.map((event) {
      var snapshot = event.snapshot;
      var data = snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        List<Car> users = [];
        data.forEach((key, value) {
          Car car = Car.fromMap(key, value);
          users.add(car);
        });
        return users;
      }
      return [];
    });
  }
}