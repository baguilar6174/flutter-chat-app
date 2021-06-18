import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
        width: double.infinity,
        height: 40,
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
      style: TextButton.styleFrom(
        elevation: 2,
        backgroundColor: Colors.blue,
        shape: StadiumBorder(),
      ),
      onPressed: this.onPressed,
    );
  }
}
