import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/global_variables.dart';
import 'package:flutter/material.dart';
import '../Services/Auth.dart';

class MyProductScreen extends StatefulWidget {
  const MyProductScreen({super.key});

  @override
  State<MyProductScreen> createState() => _MyProductScreenState();
}

class _MyProductScreenState extends State<MyProductScreen> {
  void _deleteProduct() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete Product'),
            content: Text("Are you sure want to delete?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(onPressed: () {}, child: Text("Confirm"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Products"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('products')
              .where('userID', isEqualTo: userId)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: LinearProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Failed to load Data'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No data available'));
            } else {
              final data = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: Image.network(data[index]['images'][0]),
                        title: Text(data[index]['name']),
                        subtitle: Text(data[index]['description']),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  _deleteProduct();
                                },
                                icon: const Icon(Icons.delete)),
                          ],
                        ));
                  });
            }
          }),
    );
  }
}