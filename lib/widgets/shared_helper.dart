

import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedPreferences prefs;

  static void init() async => prefs = await SharedPreferences.getInstance();

  static void saveData(value){
    prefs.setString('idToken', value);
  }

  static bool containsKey() {
    prefs.containsKey('idToken');

  }

  static void removeData() {
    prefs.remove('idToken');

  }

  static void clearData() {
   prefs.clear();
  }
}



