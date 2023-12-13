import 'package:itu_cartrack/src/model/car_model.dart';
import 'package:itu_cartrack/src/model/car.dart';

class CarController {
  static final CarController _instance = CarController._internal();

  factory CarController() {
    return _instance;
  }

  CarController._internal();

  final CarModel carModel = CarModel();

  Stream<List<Car>> get cars => carModel.getCars();

  Future<void> addCar(String name) async {
    // TODO: implement addCar
    Car newCar = Car(
      id: '',
      name: name,
      fuelType: '',
      licensePlate: '',
      alias: '',
      insurance: '',
      insuranceContact: '',
      odometerStatus: '',
      responsiblePerson: '',
      description: '',
    );
    await carModel.addCar(newCar);
  }

  Future<void> deleteCar(String carId) async {
    await carModel.deleteCar(carId);
    carModel.getCars();
  }
}
