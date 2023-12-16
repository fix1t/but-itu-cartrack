import 'dart:async';

import 'package:itu_cartrack/src/controller/login_controller.dart';
import 'package:itu_cartrack/src/model/car_model.dart';
import 'package:itu_cartrack/src/model/car.dart';
import 'package:itu_cartrack/src/model/ride.dart';

class CarController {
  static final CarController _instance = CarController._internal();
  static Car activeCar = Car();
  static Ride activeRide = Ride();
  static final CarModel carModel = CarModel();
  static Function? onOdometerChange; // Callback function

  factory CarController() {
    return _instance;
  }

  CarController._internal();

  // Shared stream for detail & home screens
  static StreamController<Car> _carStreamController = StreamController<Car>.broadcast();
  static Stream<Car> get carStream => _carStreamController.stream;

  static updateOdometer(int newOdometer) {
    activeCar.odometerStatus = newOdometer.toString();
    // Emit the updated car object through the stream
    _carStreamController.add(activeCar);
    carModel.saveCar(activeCar);
  }

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
    updateOdometer(int.parse(odometerStatus));
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

  static void startRide() {
    activeRide.startedAt = DateTime.now();
  }

  static void finishRide() {
    activeRide.finishedAt = DateTime.now();
  }

  static bool isCorrectRideInputAndSave({required int odometerStatus, required String rideType}) {
    print('Ride finished!  ${rideType}, ${odometerStatus} <- ${activeCar.odometerStatus}');
    int odometerStatusInt = int.parse(activeCar.odometerStatus);

    if (odometerStatus > int.parse(activeCar.odometerStatus) &&
        rideType.isNotEmpty) {
      // update car
      activeCar.odometerStatus = odometerStatus.toString();
      // create ride
      activeRide.rideType = rideType;
      activeRide.distance = odometerStatus - odometerStatusInt;
      activeRide.finishedAt = DateTime.now();
      activeRide.userId = LoginController().getActiveUser().id;
      activeRide.userName = LoginController().getActiveUser().name;
      activeRide.save(activeCar.id);
      updateOdometer(odometerStatus);
      return true;
    } else {
      print('Ride not finished!');
      return false;
    }
  }

  Stream<List<Ride>> getActiveCarRides() {
    return Ride().getRides(activeCar.id);
  }

  static void deleteRide(Ride ride, {bool updateOdo = false}) {
    if (updateOdo) {
      int odometerStatusChange = ride.distance;
      int newOdometerStatus = int.parse(activeCar.odometerStatus) - odometerStatusChange;
      updateOdometer(newOdometerStatus);
    }
    ride.delete(activeCar.id);
  }

  static void saveOrUpdateRide(Ride ride, {int? odometerStatusChange}) {
    ride.save(activeCar.id);
    if (odometerStatusChange != null) {
      int newOdometerStatus = int.parse(activeCar.odometerStatus) + odometerStatusChange;
      activeCar.odometerStatus = newOdometerStatus.toString();
      updateOdometer(newOdometerStatus);
    }
  }

}
