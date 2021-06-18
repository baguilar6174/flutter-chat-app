import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final String title;

  const LogoWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/images/tag-logo.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              this.title,
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
