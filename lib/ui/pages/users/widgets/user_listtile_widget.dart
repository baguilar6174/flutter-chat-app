import 'package:chat_app/domain/entities/user.dart';
import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  
  final User user;
  
  const UserListTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.user.name),
      subtitle: Text(this.user.email),
      leading: CircleAvatar(
        child: Text(this.user.name.substring(0,2)),
      ),
      trailing: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          color: this.user.online ? Colors.greenAccent : Colors.redAccent,
          borderRadius: BorderRadius.circular(100)
        ),
      ),
    );
  }
}