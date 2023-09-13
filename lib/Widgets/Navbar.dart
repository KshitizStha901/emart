import 'package:emart/Screens/AddProductScreen.dart';
import 'package:emart/Screens/HomeScreen.dart';
import 'package:emart/Screens/ProfileScreen.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  final _Screen = [HomeScreen(), AddProductScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _Screen.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo), label: 'Add Product'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.orange,
        currentIndex: _selectedIndex,
        onTap: (value) => {
          setState(() {
            _selectedIndex = value;
          })
        },
      ),
    );
  }
}
