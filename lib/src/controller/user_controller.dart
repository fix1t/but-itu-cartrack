import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:itu_cartrack/src/model/user_model.dart';


class UserController {
  final UserModel userModel;

  UserController(this.userModel);

  Stream<List<User>> get users => userModel.getUsers();

  Future<void> addUser(String name) async {
    await userModel.addUser(name);
  }
}
