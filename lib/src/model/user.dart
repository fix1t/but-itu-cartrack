class User {
  final String id;
  final String name;
  final String login;
  final String email;
  final String phoneNumber;

  User({
    this.id = '',
    this.name = '',
    this.login = '',
    this.email = '',
    this.phoneNumber = '',
  });

  factory User.fromMap(String id, Map<String, dynamic> data) {
    return User(
      id: id,
      name: data['name'] ?? '',
      login: data['login'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'login': login,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
