import 'dart:convert';
import 'package:dio/dio.dart';

class SignUpController {
 Future<String> signUp(String email, String password) async {
  final response = await Dio().post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA1h4pMtKoYT3enVNX8XHt0ZH6jXZ-S7ps',
      data: jsonEncode(
          {'email': email, 'password': password, 'returnSecureToken': true}),
      options: Options(validateStatus: (status) {
       return status < 500;
      }));
  final data = response.data as Map;
  if (data.containsKey('idToken')) {
   // idToken = data['idToken'];
   // final prefs = await SharedPreferences.getInstance();
   // prefs.setString('idToken', idToken);
   return 'ok';
  } else
   return '>>>>error,please try again>>>>';
 }
}
//  void logout() async {
//   // idToken = null;
//   final prefs = await SharedPreferences.getInstance();
//   prefs.remove('idToken');
//  }
// }
