import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String name;
  final String description;
  final String category;
  final String price;
  final String image;

  const ProductCard(
      {required this.name,
      required this.description,
      required this.category,
      required this.price,
      required this.image,
      super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ClipRect(
              child: Image.network(widget.image,
                  fit: BoxFit.cover, width: 1000, height: 120),
            ),
            Text(
              widget.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              widget.category,
              style: TextStyle(fontSize: 13),
            ),
            Text(
              "NPR.${widget.price}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Color.fromARGB(255, 194, 84, 76)),
            )
          ],
        ));
  }
}
