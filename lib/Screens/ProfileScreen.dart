import 'package:emart/global_variables.dart';
import 'package:flutter/material.dart';

import '../Services/Auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _signout() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Sign Out'),
            content: Text("Are you sure want to Logout?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    Auth().signOut();
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text("Confirm"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                "https://i.pinimg.com/1200x/c5/ac/9b/c5ac9b6d86637c76fab3ba477f4f4928.jpg"),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "$firstname $lastname ",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 05,
          ),
          Text(
            "$email",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Divider(
            height: 40,
          ),
          Expanded(
              child: ListView(children: [
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/editprofile');
              },
              leading: Icon(Icons.person),
              title: Text("Edit Profile"),
              subtitle: Text("Change your profile details"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/myproduct');
              },
              leading: Icon(Icons.production_quantity_limits),
              title: Text("My Products"),
              subtitle: Text("View your products"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/changepass');
              },
              leading: Icon(Icons.password),
              title: Text("Change Password"),
              subtitle: Text("Change your password"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/favourite');
              },
              leading: Icon(Icons.favorite),
              title: Text("Favourite Product"),
              subtitle: Text("View your products"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ])),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                _signout();
              },
              child: Text('Logout'))
        ],
      )),
    );
  }
}
