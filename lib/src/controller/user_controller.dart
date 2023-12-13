import 'package:itu_cartrack/src/model/user_model.dart';
import 'package:itu_cartrack/src/model/user.dart';

class UserController {
  final UserModel userModel;

  // Private constructor for the Singleton pattern
  UserController._private(this.userModel);

  static final UserController _instance = UserController._private(UserModel());

  factory UserController() {
    return _instance;
  }

  Stream<List<User>> get users => userModel.getUsers();

  Future<void> addUser(String name) async {
    await userModel.addUser(name);
  }

  Future<void> deleteUser(String userId) async {
    await userModel.deleteUser(userId);
    userModel.getUsers();
  }
}
