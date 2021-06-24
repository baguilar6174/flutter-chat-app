// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Messages {
  List<Message> messages = [];
  Messages.fromJsonList(List<dynamic> jsonList) {
    // ignore: unnecessary_null_comparison
    if (jsonList == null) return;
    jsonList.forEach((message) {
      messages.add(Message.fromJson(message));
    });
  }
}


class Message {
    Message({
        required this.from,
        required this.to,
        required this.message,
        required this.createdAt,
        required this.updatedAt,
    });

    final String from;
    final String to;
    final String message;
    final DateTime createdAt;
    final DateTime updatedAt;

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        from: json["from"],
        to: json["to"],
        message: json["message"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "message": message,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}