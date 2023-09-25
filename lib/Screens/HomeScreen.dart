import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/Model/Products.dart';
import 'package:flutter/material.dart';

import '../Widgets/ProductCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//List of Images

  List<String> get imgList => [
        'https://i.pinimg.com/564x/cf/9f/5e/cf9f5e2130513e2fb550cf36ea3c1d6e.jpg',
        'https://i.pinimg.com/564x/90/fb/f6/90fbf6181ed4594ac92e634366b3b25d.jpg',
        'https://i.pinimg.com/564x/95/ed/1a/95ed1a72ce4860097682be696e172144.jpg',
        'https://i.pinimg.com/564x/65/9c/2f/659c2ff15fe7c2402bdda57dc42d53cf.jpg',
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Welcome, Kshitiz!"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
                options: CarouselOptions(),
                items: imgList
                    .map((item) => Container(
                          child: Image.network(item),
                        ))
                    .toList()),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Showing Popular Products",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            // /FutureBuilder for getting Products
            FutureBuilder<QuerySnapshot?>(
                future: FirebaseFirestore.instance.collection('products').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: LinearProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Failed to load Data'));
                  } else if (!snapshot.hasData) {
                    return const Center(child: Text('No data available'));
                  } else {
                    final data = snapshot.data!.docs;
                    return GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(data.length, (index) {
                          return ProductCard(
                            name: data[index]['name'],
                            price: data[index]['price'],
                            description: data[index]['description'],
                            category: data[index]['category'],
                            image: data[index]['images'][0],
                          );
                        }));
                  }
                })
          ],
        ),
      ),
    );
  }
}
