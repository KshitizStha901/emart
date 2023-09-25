import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Local_Storage/SharedPref.dart';
import '../Model/Users.dart';

class Auth {
  final _auth = FirebaseAuth.instance;
  Future<bool> login(String email, String password) async {
    bool isLogin = false;
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      String userId = value.user!.uid;
      var result = await FirebaseFirestore.instance
          .collection('UserDetails')
          .doc(userId)
          .get();
      var decodeJson = Users().fromJson(result.data()!);
      await SharedPref().setUserData(userId, decodeJson);
      isLogin = true;
    }).catchError((error) => {isLogin = false});
    return isLogin;
  }

  Future<bool> register(String firstname, String lastname, String username,
      String email, String password) async {
    bool isRegister = false;

    //register to authenication step1
    UserCredential register = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    //step2 | get user id
    String userId = register.user!.uid;

    //step3  | create user profile in firebase database

    await FirebaseFirestore.instance
        .collection('UserDetails')
        .doc(userId)
        .set({
          'firstname': firstname,
          'lastname': lastname,
          'username': username,
          'email': email,
        })
        .then((value) => {isRegister = true})
        .catchError((error) => {isRegister = false});

    return isRegister;
  }

  //auto login
  // '?' for user present or not
  Future<User?> autoLogin() async {
    User? user = _auth.currentUser;
    return user;
  }
}
