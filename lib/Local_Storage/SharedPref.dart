import 'package:shared_preferences/shared_preferences.dart';

import '../global_variables.dart';

class SharedPref {
//function to set String
  Future<void> setUserData(userId, data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', userId);
    prefs.setString('firstname', data.firstname);
    prefs.setString('lastname', data.lastname);
    prefs.setString('email', data.email);
    prefs.setString('username', data.username);
    prefs.setString('phoneNumber', data.phoneNumber);
    prefs.setString('profileImage', data.profileImage);
  }

  Future<void> updateUserData(updatedData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('firstName', updatedData.firstName);
    prefs.setString('lastName', updatedData.lastName);
    prefs.setString('username', updatedData.username);
    prefs.setString('phoneNumber', updatedData.phoneNumber);
    prefs.setString('profileImage', updatedData.profileImage);
  }

  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');
    firstname = prefs.getString('firstname');
    lastname = prefs.getString('lastname');
    email = prefs.getString('email');
    username = prefs.getString('username');
    phoneNumber = prefs.getString("phoneNumber");
    profileImage = prefs.getString("profileImage");
  }

  //remove user data
  Future<void> removeUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userId');
    prefs.remove('firstname');
    prefs.remove('lastname');
    prefs.remove('email');
    prefs.remove('username');
    prefs.remove('phoneNumber');
    prefs.remove('profileImage');
  }
}
