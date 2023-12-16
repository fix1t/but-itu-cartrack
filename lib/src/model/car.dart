/// Car model
/// @author: Jakub Mikysek xmikys03
/// @author: Gabriel Biel  xbielg00

class Car {
  String id;
  String name;
  String fuelType;
  String licensePlate;
  String alias;
  String insurance;
  String insuranceContact;
  String odometerStatus;
  String responsiblePerson;
  String description;

  Car({
    this.id='',
    this.name = '',
    this.fuelType = '',
    this.licensePlate = '',
    this.alias = '',
    this.insurance = '',
    this.insuranceContact = '',
    this.odometerStatus = '',
    this.responsiblePerson = '',
    this.description = '',
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
