import 'dart:convert';

import 'package:dio/dio.dart';

class LoginController {
  Future<String> login(String email, String password) async {
    final response = await Dio().post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyA1h4pMtKoYT3enVNX8XHt0ZH6jXZ-S7ps',
        data: jsonEncode(
            {'email': email, 'password': password, 'returnSecureToken': true}),
        options: Options(validateStatus: (status) {
      return status < 500;
    }));
    final data = response.data as Map;
    if (data.containsKey('idToken'))
      return 'ok';
    else
      return data['error_warning'];
  }
}
