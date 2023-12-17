/// Purpose: Controller class for the User model, handles all the business logic for the User model such as adding, deleting and updating users and their favorite cars
/// @Author: Gabriel Biel xbielg00 -- added addUser, deleteUser methods, constructor, users getter
/// @Author: Adam Gabrys xgabry01 -- added getUserById method, added car related methods

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
  
  Future<User?> getUserById(String userId) async {
    // Call the UserModel to query the database
    return userModel.getUserById(userId);
  }

  // Adds a car to the user's list of favorites
  Future<void> addFavoriteCar(User user, String carId) async {
    if (!user.favoriteCars.contains(carId)) {
      user.favoriteCars.add(carId);
      await userModel.updateUserFavorites(user.id, user.favoriteCars);
    }
  }

  // Update user's favorite cars in the database
  Future<void> updateUserFavorites(String userId, List<String> favoriteCars) async {
    await userModel.updateUserFavorites(userId, favoriteCars);
  }

  // Removes a car from the user's list of favorites
  Future<void> removeFavoriteCar(User user, String carId) async {
    if (user.favoriteCars.contains(carId)) {
      user.favoriteCars.remove(carId);
      await userModel.updateUserFavorites(user.id, user.favoriteCars);
    }
  }

  // Checks if a car is in the user's list of favorites
  bool isFavoriteCar(User user, String carId) {
    return user.favoriteCars.contains(carId);
  }
}
