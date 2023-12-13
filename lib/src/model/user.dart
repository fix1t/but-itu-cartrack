class User {
  final String id;
  final String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.fromMap(String id, Map<dynamic, dynamic> data) {
    return User(
      id: id,
      name: data['name'],
    );
  }
}