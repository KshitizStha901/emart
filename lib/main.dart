import 'package:emart/Screens/AddProductScreen.dart';
import 'package:emart/Screens/ProfileScreen.dart';
import 'package:emart/Screens/RegisterScreen.dart';
import 'package:emart/Screens/SplashScreen.dart';
import 'package:emart/Widgets/Navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Services/Auth.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  User? user = await Auth().autoLogin();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: user != null ? '/navbar' : '/',
    routes: {
      '/': (context) => const SplashScreen(),
      '/login': (context) => LoginScreen(),
      '/register': (context) => RegisterScreen(),
      '/home': (context) => HomeScreen(),
      '/navbar': (context) => Navbar(),
      '/addproduct': (context) => AddProductScreen(),
      '/profile': (context) => ProfileScreen()
    },
  ));
}
