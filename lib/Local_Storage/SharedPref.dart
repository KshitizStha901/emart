import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
//function to set String
  Future<void> setUserData(userId, data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', userId);
    prefs.setString('firstname', data.firstname);
    prefs.setString('lastname', data.lastname);
    prefs.setString('email', data.email);
    prefs.setString('username', data.username);
  }
}
