class Ride {
  final String id;
  final String userId;
  final DateTime startedAt;
  final DateTime finishedAt;
  final String rideType; // Ex: 'Business', 'Personal', etc.
  final double distance; // Distance in kilometers

  Ride({
    this.id = '',
    this.userId = '',
    DateTime? startedAt,
    DateTime? finishedAt,
    this.rideType = '',
    this.distance = 0.0,
  })   : startedAt = startedAt ?? DateTime.now(),
        finishedAt = finishedAt ?? DateTime.now();


  factory Ride.fromMap(String id, Map<String, dynamic> data) {
    return Ride(
      id: id,
      userId: data['userId'] ?? '',
      startedAt: DateTime.parse(data['startedAt'] ?? ''),
      finishedAt: DateTime.parse(data['finishedAt'] ?? ''),
      rideType: data['rideType'] ?? '',
      distance: (data['distance'] ?? 0.0).toDouble(),
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
}
