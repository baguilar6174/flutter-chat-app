import 'package:chat_app/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/services/socket_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<SocketService>(create: (_) => SocketService()),
        // ChangeNotifierProvider<ChatService>(create: (_) => ChatService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        // Initial route application.
        initialRoute: 'splash',
        // Application routes.
        routes: customRoutes,
      ),
    );
  }
}
