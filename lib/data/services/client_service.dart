import 'package:chat_app/domain/entities/message_model.dart';
import 'package:chat_app/domain/entities/user_mode.dart';
import 'package:chat_app/global/environment.dart';
import 'package:chat_app/utils/user_preferences.dart';
import 'package:dio/dio.dart';

class ClientService {
  ClientService._interna();
  static ClientService _instance = ClientService._interna();
  static ClientService get instance => _instance;

  final Dio _dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  Future<List<User>> getUsers() async {
    try {
      final String? accessToken = await UserPreferences.instance.accessToken;
      final Response response = await this._dio.get(
            '/users',
            options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization': '$accessToken'
              },
            ),
          );
      final users = new Users.fromJsonList(response.data['users']);
      return users.users;
    } catch (e) {
      print('entra catch');
      if (e is DioError) {
        print(e.response?.statusCode);
        print(e.response?.data);
      } else {
        print('=== Shapepap === :::: Error ::::' + e.toString());
      }
      return [];
    }
  }

  Future<List<Message>> getMessages(String code) async {
    try {
      
      final String? accessToken = await UserPreferences.instance.accessToken;

      final Response response = await this._dio.get(
            '/messages/$code',
            options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization': '$accessToken'
              },
            ),
          );
      final messages = new Messages.fromJsonList(response.data['messages']);
      return messages.messages;
    } catch (e) {
      print('entra catch');
      if (e is DioError) {
        print(e.response?.statusCode);
        print(e.response?.data);
      } else {
        print('=== Shapepap === :::: Error ::::' + e.toString());
      }
      return [];
    }
  }
}
