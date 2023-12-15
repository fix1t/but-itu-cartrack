import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class Ride {
  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  String id;
  String userId;
  String userName;
  DateTime startedAt;
  DateTime finishedAt;
  String rideType; // Enum: 'Business', 'Personal', 'Other' ...
  int distance; // Distance in kilometers

  Ride({
    this.id = '',
    this.userId = '',
    this.userName = '',
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
      userName: data['userName'] ?? '',
      startedAt: DateTime.parse(data['startedAt'] ?? ''),
      finishedAt: DateTime.parse(data['finishedAt'] ?? ''),
      rideType: data['rideType'] ?? '',
      distance: (data['distance'] ?? 0)
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
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

  Stream<List<Ride>> getRides(String carId) {
    DatabaseReference ridesRef = databaseReference.child('cars').child(carId).child('rides');
    return ridesRef.onValue.map((event) {
      var snapshot = event.snapshot;
      var data = snapshot.value as Map<dynamic, dynamic>?;

      List<Ride> ridesList = [];

      if (data != null) {
        data.forEach((key, value) {
          print(value);
          if (value is Map<Object?, Object?>) {
            Ride ride = Ride.fromMap(key, value.cast<String, dynamic>());
            ridesList.add(ride);
          }
        });
        // Sort ridesList based on startedAt date
        ridesList.sort((a, b) => b.startedAt.compareTo(a.startedAt));
      }
      return ridesList;
    });
  }

  void delete(String id) {
    databaseReference.child('cars').child(id).child('rides').child(this.id).remove();
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

// Function to convert string to RideType enum
RideType stringToRideType(String rideTypeString) {
  switch (rideTypeString.toLowerCase()) {
    case 'business':
      return RideType.Business;
    case 'personal':
      return RideType.Personal;
    case 'commute':
      return RideType.Commute;
    case 'delivery':
      return RideType.Delivery;
    case 'leisure':
      return RideType.Leisure;
    case 'other':
      return RideType.Other;
    default:
      return RideType.Other; // Default value or handle accordingly
  }
}

