import 'package:chat_app/domain/entities/session_model.dart';
import 'package:chat_app/utils/user_preferences.dart';
import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  @override
  void initState() {
    this._check();
    super.initState();
  }

   _check() async {
  
    final Session? sessionShopper = await UserPreferences.instance.getSession();
    
    if (sessionShopper != null) {
      Navigator.pushReplacementNamed(context, 'users');
    } else {
      Navigator.pushReplacementNamed(context, 'login');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
   );
  }
}