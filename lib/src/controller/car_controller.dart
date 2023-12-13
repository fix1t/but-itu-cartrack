import 'package:itu_cartrack/src/model/car_model.dart';
import 'package:itu_cartrack/src/model/car.dart';

class CarController {
  static final CarController _instance = CarController._internal();

  factory CarController() {
    return _instance;
  }

  CarController._internal();

  final CarModel carModel = CarModel(); // Assuming CarModel is your model class

  Stream<List<Car>> get cars => carModel.getCars();

  Future<void> addCar(String name) async {
    await carModel.addCar(name);
  }

  Future<void> deleteCar(String carId) async {
    await carModel.deleteCar(carId);
    carModel.getCars();
  }
}
