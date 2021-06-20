import 'package:chat_app/ui/router.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      // Initial route application.
      initialRoute: 'splash',
      // Application routes.
      routes: customRoutes,
    );
  }
}
