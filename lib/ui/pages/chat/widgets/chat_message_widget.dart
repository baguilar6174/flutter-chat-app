import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {
  
  final String ownerCode;
  final String text;
  final String uuid;
  final AnimationController animationController;

  const ChatMessageWidget({
    Key? key,
    required this.text,
    required this.uuid,
    required this.animationController,
    required this.ownerCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: this.animationController, curve: Curves.easeOut),
        child: Container(
          child: this.uuid == this.ownerCode ?
          _myMessage():_notMyMessage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(
          bottom: 10,
          left: 50,
          right: 10
        ),
        child: Text(this.text, style: TextStyle(color: Colors.white),),
        decoration: BoxDecoration(
          color: Color(0xff4D9EF6),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }

  Widget _notMyMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(
          bottom: 10,
          left: 10,
          right: 50
        ),
        child: Text(this.text, style: TextStyle(color: Colors.black87),),
        decoration: BoxDecoration(
          color: Color(0xffE4E5E8),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}
