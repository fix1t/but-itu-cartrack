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

  Future<void> addUser({
    required String name,
    String login = '',
    String email = '',
    String phoneNumber = '',
  }) async {
    // Creating a User object using the provided arguments
    User user = User(
      id: '',
      name: name,
      login: login,
      email: email,
      phoneNumber: phoneNumber,
    );

    // Calling the addUser method from UserModel with the User object
    await userModel.addUser(user);
  }

  Future<void> deleteUser(String userId) async {
    await userModel.deleteUser(userId);
    userModel.getUsers();
  }

  // Stream<User?> getUserById(String userId) {
  //   return userModel.getUserById(userId);
  // }
}
