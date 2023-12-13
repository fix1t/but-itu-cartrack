import 'package:itu_cartrack/src/model/car_model.dart';
import 'package:itu_cartrack/src/model/car.dart';

class CarController {
  final CarModel userModel;

  CarController(this.userModel);

  Stream<List<Car>> get users => userModel.getCars();

  Future<void> addCar(String name) async {
    await userModel.addCar(name);
  }

  Future<void> deleteCar(String userId) async {
    await userModel.deleteCar(userId);
    userModel.getCars();
  }
}
