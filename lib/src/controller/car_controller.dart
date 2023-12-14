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

  Future<void> addCar(String name, String fuelType, String licensePlate) async {
    // TODO: implement addCar
    Car newCar = Car(name: name, fuelType: fuelType, licensePlate: licensePlate);
    await carModel.addCar(newCar);
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
