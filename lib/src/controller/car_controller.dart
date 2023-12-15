import 'dart:ffi';

import 'package:itu_cartrack/src/model/car_model.dart';
import 'package:itu_cartrack/src/model/car.dart';

class CarController {
  static final CarController _instance = CarController._internal();
  static Car activeCar = Car();

  factory CarController() {
    return _instance;
  }

  CarController._internal();

  final CarModel carModel = CarModel();

  Stream<List<Car>> get cars => carModel.getCars();

  Future<void> addCar(
      String name,
      String alias,
      String fuelType,
      String licensePlate,
      String insuranceContact,
      String odometerStatus,
      String description) async {
    Car newCar = Car(
        name: name,
        alias: alias,
        fuelType: fuelType,
        licensePlate: licensePlate,
        insuranceContact: insuranceContact,
        odometerStatus: odometerStatus,
        description: description);
    await carModel.addCar(newCar);
  }

  Future<void> updateCar(
      String carId,
      String name,
      String alias,
      String fuelType,
      String licensePlate,
      String insurance,
      String insuranceContact,
      String odometerStatus,
      String description) async {
    Car updatedCar = Car(
        name: name,
        alias: alias,
        fuelType: fuelType,
        licensePlate: licensePlate,
        insurance: insurance,
        insuranceContact: insuranceContact,
        odometerStatus: odometerStatus,
        description: description);
    await carModel.updateCar(carId, updatedCar);
  }

  Future<void> deleteCar(String carId) async {
    await carModel.deleteCar(carId);
    carModel.getCars();
  }

  void setActiveCar(Car car) {
    activeCar = car;
  }

  Car getActiveCar() {
    return activeCar;
  }
}
