/// User model class that handles all the CRUD operations for the User handling.
/// It is a Singleton class that uses Firebase Realtime Database to store the data.
/// @author: Gabriel Biel xbielg00
/// @modified: Adam Gabrys xgabry01 -- added favoriteCars

class User {
  final String id;
  final String name;
  final String login;
  final String email;
  final String phoneNumber;
  List<String> favoriteCars;

  User({
    this.id = '',
    this.name = '',
    this.login = '',
    this.email = '',
    this.phoneNumber = '',
    List<String>? favoriteCars, // Use a nullable list for the initializer
  }) : favoriteCars = favoriteCars ?? []; // Default to an empty list if null

  factory User.fromMap(String id, Map<String, dynamic> data) {
    return User(
      id: id,
      name: data['name'] ?? '',
      login: data['login'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      favoriteCars: List<String>.from(data['favoriteCars'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'login': login,
      'email': email,
      'phoneNumber': phoneNumber,
      'favoriteCars': favoriteCars,
    };
  }
}