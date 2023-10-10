import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/Widgets/Esnackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  //product image
  List<dynamic> imgList = [];

  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  void getUserData() async {
    if (userId != null) {
      var result = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      setState(() {
        firstName = result['firstname'];
        lastName = result['lastname'];
        email = result['email'];
      });
    }
  }

  //open mail app
  void _goToMail() async {
    try {
      final mailData = Mailto(
          to: [email!],
          subject: "Product Inquiry",
          body: "Hi, I am interested in your product. Please contact me.");
      await launch('$mailData.');
    } catch (e) {
      print(e);
    }
  }

  bool isFavourite = false;
  String? productId;
  String? productName;
  String? productImage;

  void _favouriteFunction() async {
    setState(() {
      isFavourite = !isFavourite;
    });

    //finding user document
    final userDocument = FirebaseFirestore.instance
        .collection("userdetails")
        .doc(FirebaseAuth.instance.currentUser!.uid);

    final favouriteData = {
      "productId": productId,
      "productName": productName,
      "productImage": productImage
    };
    try {
      //if its true remove from favourite
      if (isFavourite) {
        await userDocument.update({
          "favourites": FieldValue.arrayRemove([favouriteData])
        });
      }
    } catch (e) {
      Esnackbar.show(context, "Error occured");
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)!.settings.arguments as Map;
    userId = data['userId'];
    productId = data['id'];
    productName = data['name'];
    productImage = data['images']['0'];
    imgList = data['images'];

    getUserData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CarouselSlider(
              options: CarouselOptions(autoPlay: true),
              items: imgList
                  .map((item) => Container(
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          width: 1000,
                        ),
                      ))
                  .toList()),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data['name'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "NPR.${data['price']}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            "Listed by: $firstName $lastName",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            data['description'],
            style: TextStyle(fontSize: 17),
          ),
          const SizedBox(height: 20),
          Text(
            "Category: Basketball Shoes",
            style: TextStyle(fontSize: 15),
          ),
          Row(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    _goToMail();
                  },
                  child: Text("Contact with email")),
              IconButton(
                onPressed: () {
                  _favouriteFunction();
                },
                icon:
                    Icon(isFavourite ? Icons.favorite : Icons.favorite_border),
              )
            ],
          )
        ]),
      ),
    );
  }
}
