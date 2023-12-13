

class Car {
  final String id;
  final String name;

  Car({
    required this.id,
    required this.name,
  });

  factory Car.fromMap(String id, Map<dynamic, dynamic> data) {
    return Car(
      id: id,
      name: data['name'],
    );
  }
}