import 'package:emart/Screens/AddProductScreen.dart';
import 'package:emart/Screens/ChangePasswordScreen.dart';
import 'package:emart/Screens/EditProfileScreen.dart';
import 'package:emart/Screens/FavouriteScreen.dart';
import 'package:emart/Screens/MyProductsScreen.dart';
import 'package:emart/Screens/ProductDetails.dart';
import 'package:emart/Screens/ProfileScreen.dart';
import 'package:emart/Screens/RegisterScreen.dart';
import 'package:emart/Screens/SplashScreen.dart';
import 'package:emart/Widgets/Navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Local_Storage/SharedPref.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/SearchScreen.dart';
import 'Services/Auth.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPref().getUserData();

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
      '/profile': (context) => ProfileScreen(),
      '/details': (context) => ProductDetails(),
      '/search': (context) => SearchScreen(),
      '/myproduct': (context) => MyProductScreen(),
      '/favourite': (context) => FavouriteScreen(),
      '/editprofile': (context) => EditProfileScreen(),
      '/changepass': (context) => ChangePasswordScreen()
    },
  ));
}
