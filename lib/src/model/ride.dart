import 'package:firebase_database/firebase_database.dart';

class Ride {
  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  String id;
  String userId;
  DateTime startedAt;
  DateTime finishedAt;
  String rideType; // Enum: 'Business', 'Personal', 'Other' ...
  int distance; // Distance in kilometers

  Ride({
    this.id = '',
    this.userId = '',
    DateTime? startedAt,
    DateTime? finishedAt,
    this.rideType = '',
    this.distance = 0,
  })   : startedAt = startedAt ?? DateTime.now(),
        finishedAt = finishedAt ?? DateTime.now();


  factory Ride.fromMap(String id, Map<String, dynamic> data) {
    return Ride(
      id: id,
      userId: data['userId'] ?? '',
      startedAt: DateTime.parse(data['startedAt'] ?? ''),
      finishedAt: DateTime.parse(data['finishedAt'] ?? ''),
      rideType: data['rideType'] ?? '',
      distance: (data['distance'] ?? 0)
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'startedAt': startedAt.toIso8601String(),
      'finishedAt': finishedAt.toIso8601String(),
      'rideType': rideType,
      'distance': distance,
    };
  }

  void save(carId) {
    // saves new if id is empty & updates if id is not empty
    if (id.isEmpty) {
      databaseReference.child('cars').child(carId).child('rides').push().set(toMap());
    } else {
      databaseReference.child('cars').child(carId).child('rides').child(id).set(toMap());
    }
  }
}

enum RideType {
  Business,
  Personal,
  Commute,
  Delivery,
  Leisure,
  Other,
}
