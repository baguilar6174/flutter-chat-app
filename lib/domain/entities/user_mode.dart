import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

//     final user = userFromJson(jsonString);

class User {
  User({
    required this.online,
    required this.email,
    required this.name,
    required this.code,
  });

  final String code;
  final String email;
  final String name;
  final bool online;

  factory User.fromJson(Map<String, dynamic> json) => User(
        code: json["code"],
        email: json["email"],
        name: json["name"],
        online: json["online"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "email": email,
        "name": name,
        "online": online,
      };
}