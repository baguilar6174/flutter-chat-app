import 'dart:async';
import 'dart:convert';

import 'package:chat_app/domain/entities/session_model.dart';
import 'package:chat_app/domain/entities/user_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserPreferences {
  UserPreferences._internal();
  static UserPreferences _instance = UserPreferences._internal();
  static UserPreferences get instance => _instance;

  final _storage = FlutterSecureStorage();

  Future<String?> get accessToken async {
    // TODO: refresh token
    final Session? session = await this.getSession();
    if (session != null) {
      return session.token;
    }
    print('=== ChatApp === :::: Session null ::::');
    return null;
  }


  Future<User?> get user async {
    final Session? session = await this.getSession();
    if (session != null) {
      return session.user;
    }
    print('=== ChatApp === :::: User Session ::::');
    return null;
  }

  Future<void> setSession(Map<String, dynamic> data) async {
    
    final Session session = Session(
      ok: data['ok'],
      user: User.fromJson(data['user']),
      token: data['token'],
    );
    final String value = jsonEncode(session.toJson());
    await this._storage.write(key: 'USER_SESSION', value: value);
    print('=== ChatApp === :::: Session saved ::::');
  }

  Future<void> updateSession(Session session) async {
    final String value = jsonEncode(session.toJson());
    await this._storage.write(key: 'USER_SESSION', value: value);
    print('=== ChatApp === :::: Session saved ::::');
  }

  Future<Session?> getSession() async {
    final String? value = await this._storage.read(key: 'USER_SESSION');
    if (value != null) {
      final Map<String, dynamic> json = jsonDecode(value);
      return Session.fromJson(json);
    }
    return null;
  }

  Future<void> logOut(BuildContext context) async {
    /**Vaciar el secure storage con todos los datos del usuario */
    await this._storage.deleteAll();
    print('=== ChatApp === :::: Session Finalice ::::');
    Navigator.pushNamedAndRemoveUntil(context, 'login', (_) => false);
  }

}
