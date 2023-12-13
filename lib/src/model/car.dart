class Car {
  final String id;
  final String name;
  final String fuelType;
  final String licensePlate;
  final String alias;
  final String insurance;
  final String insuranceContact;
  final String odometerStatus;
  final String responsiblePerson;
  final String description;

  Car({
    required this.id,
    required this.name,
    required this.fuelType,
    required this.licensePlate,
    required this.alias,
    required this.insurance,
    required this.insuranceContact,
    required this.odometerStatus,
    required this.responsiblePerson,
    required this.description,
  });

  factory Car.fromMap(String id, Map<String, dynamic> data) {
    return Car(
      id: id,
      name: data['name'] ?? '',
      fuelType: data['fuel_type'] ?? '',
      licensePlate: data['licence_plate'] ?? '',
      alias: data['alias'] ?? '',
      insurance: data['insurance'] ?? '',
      insuranceContact: data['insurance_contact'] ?? '',
      odometerStatus: data['odometer_status'] ?? '',
      responsiblePerson: data['responsible_person'] ?? '',
      description: data['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'fuel_type': fuelType,
      'licence_plate': licensePlate,
      'alias': alias,
      'insurance': insurance,
      'insurance_contact': insuranceContact,
      'odometer_status': odometerStatus,
      'responsible_person': responsiblePerson,
      'description': description,
    };
  }
}
