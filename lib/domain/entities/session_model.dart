import 'dart:convert';

import 'package:chat_app/domain/entities/user_mode.dart';

Session sessionFromJson(String str) => Session.fromJson(json.decode(str));
String sessionToJson(Session data) => json.encode(data.toJson());

//     final session = sessionFromJson(jsonString);

class Session {
  Session({
    required this.ok,
    required this.user,
    required this.token,
  });

  final bool ok;
  final User user;
  final String token;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        ok: json["ok"],
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "user": user.toJson(),
        "token": token,
      };
}