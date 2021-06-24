import 'package:flutter/material.dart';

import 'package:chat_app/ui/pages/login/login_page.dart';
import 'package:chat_app/ui/pages/register/register_page.dart';
import 'package:chat_app/ui/pages/splash/splash_page.dart';
import 'package:chat_app/ui/pages/users/users_page.dart';

final customRoutes = <String, WidgetBuilder> {
  'users'    : (BuildContext context) => UsersPage(),
  'login'    : (BuildContext context) => LoginPage(),
  'register' : (BuildContext context) => RegisterPage(),
  'splash'   : (BuildContext context) => SplashPage(),
};
