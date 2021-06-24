import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

//     final user = userFromJson(jsonString);

class Users {
  List<User> users = [];
  Users.fromJsonList(List<dynamic> jsonList) {
    // ignore: unnecessary_null_comparison
    if (jsonList == null) return;
    jsonList.forEach((user) {
      users.add(User.fromJson(user));
    });
  }
}

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