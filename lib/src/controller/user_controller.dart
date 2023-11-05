import 'package:itu_cartrack/src/model/user_model.dart';


class UserController {
  final UserModel userModel;

  UserController(this.userModel);

  Stream<List<User>> get users => userModel.getUsers();

  Future<void> addUser(String name) async {
    await userModel.addUser(name);
  }
}
