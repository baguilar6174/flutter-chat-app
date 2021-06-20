import 'package:chat_app/global/environment.dart';
import 'package:chat_app/utils/dialogs.dart';
import 'package:chat_app/utils/user_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class AuthService {

  AuthService._interna();
  static AuthService _instance = AuthService._interna();
  static AuthService get instance => _instance;

  final Dio _dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  Future<void> signIn(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    final ProgressDialog progressDialog = ProgressDialog(context);
    try {
      progressDialog.show();
      final Response response = await this._dio.post(
        '/auth/signin',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // print(response.data);
        await UserPreferences.instance.setSession(response.data);
        progressDialog.dismiss();
        Navigator.pushNamedAndRemoveUntil(context, 'users', (_) => false);
      }
    } catch (e) {
      progressDialog.dismiss();
      if (e is DioError) {
        print(e.response?.data);
        print(e.response?.statusCode);
        String _message = '';
        if (e.response?.statusCode == 400) {
          _message = e.response?.data['message'];
        }
        Dialogs.info(context, title: 'ERROR', content: _message);
      } else {
        print('=== ChatApp === :::: Error ::::' + e.toString());
      }
    }
  }

  Future<void> signUp(
    BuildContext context, {
    required String name,
    required String email,
    required String password,
  }) async {
    final ProgressDialog progressDialog = ProgressDialog(context);
    try {
      progressDialog.show();
      final Response response = await this._dio.post(
        '/auth/signup',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // print(response.data);
        await UserPreferences.instance.setSession(response.data);
        progressDialog.dismiss();
        Navigator.pushNamedAndRemoveUntil(context, 'users', (_) => false);
      }
    } catch (e) {
      progressDialog.dismiss();
      if (e is DioError) {
        print(e.response?.data);
        print(e.response?.statusCode);
        String _message = '';
        if (e.response?.statusCode == 400) {
          _message = e.response?.data['message'];
        }
        Dialogs.info(context, title: 'ERROR', content: _message);
      } else {
        print('=== ChatApp === :::: Error ::::' + e.toString());
      }
    }
  }
}
