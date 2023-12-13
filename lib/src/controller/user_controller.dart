import 'package:itu_cartrack/src/model/user_model.dart';
import 'package:itu_cartrack/src/model/user.dart';


class UserController {
  final UserModel userModel;

  UserController(this.userModel);

  Stream<List<User>> get users => userModel.getUsers();

  Future<void> addUser(String name) async {
    await userModel.addUser(name);
  }

  Future<void> deleteUser(String userId) async {
    await userModel.deleteUser(userId);
    userModel.getUsers();
  }
}
