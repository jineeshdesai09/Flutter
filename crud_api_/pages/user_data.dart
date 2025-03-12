// user_data.dart
class User {
  String id;
  String name;
  String? email; // Make email and phoneNumber nullable as they might be optional in the API or when adding
  String? phoneNumber;

  User({required this.id, required this.name, this.email, this.phoneNumber});

  static User toUser(Map<String, dynamic> map) {
    return User(
      id: map['id'].toString(),
      name: map['name'],
      email: map['email'], // Add email
      phoneNumber: map['phoneNumber'], // Add phoneNumber
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email, // Add email
      'phoneNumber': phoneNumber, // Add phoneNumber
    };
  }
}