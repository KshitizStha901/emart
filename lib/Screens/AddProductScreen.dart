import 'dart:io';

import 'package:emart/Services/ProductServices.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  String category = "Fashion";
  final List<String> _selectedImages = [];

  //camera and gallery function
  void openMedia(ImageSource source) async {
    final PermissionStatus = await Permission.camera.request();
    if (PermissionStatus.isPermanentlyDenied) {
      openAppSettings();
    }
    final Image = await ImagePicker().pickImage(source: source);
    if (Image != null) {
      setState(() {
        _selectedImages.add(Image.path);
      });
    }
  }

  //controller
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  //form key
  final _formKey = GlobalKey<FormState>();

  void _addProduct() async {
    List<String?> uploadedUrls = [];

    // forloop for uploading each images in array

    for (final eachImage in _selectedImages) {
      final url = await ProductServices().uploadImage(File(eachImage));
      if (url != null) {
        uploadedUrls.add(url);
      }
    }
    print(uploadedUrls);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter product name";
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                ),
              ),
              TextFormField(
                controller: _descriptionController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter product description";
                  }
                },
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Product Description',
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text("Select Category",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              DropdownButton(
                  value: category,
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(child: Text("Fashion"), value: "Fashion"),
                    DropdownMenuItem(
                        child: Text("Electronics"), value: "Electronics"),
                    DropdownMenuItem(child: Text("Sports"), value: "Sports"),
                    DropdownMenuItem(
                        child: Text("Property"), value: "Proeprty"),
                    DropdownMenuItem(child: Text("Jobs"), value: "Jobs"),
                    DropdownMenuItem(child: Text("Other"), value: "Other"),
                  ],
                  onChanged: (value) {
                    setState(() {
                      category = value.toString();
                    });
                  }),
              TextFormField(
                controller: _priceController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter Price ";
                  }
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Product Price',
                ),
              ),

              const SizedBox(height: 20),
              //add image widget
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add product image",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            openMedia(ImageSource.camera);
                          },
                          icon: Icon(Icons.camera_alt)),
                      IconButton(
                          onPressed: () {
                            openMedia(ImageSource.gallery);
                          },
                          icon: Icon(Icons.photo)),
                    ],
                  ),
                ],
              ),
              _selectedImages.isNotEmpty
                  ? SizedBox(
                      height: 100,
                      child: ListView.builder(
                          itemCount: _selectedImages.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final Image = _selectedImages[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.black),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(File(Image)))),
                                  ),
                                  Positioned(
                                    child: IconButton(
                                      color: Colors.black,
                                      onPressed: () {
                                        setState(() {
                                          _selectedImages.removeAt(index);
                                        });
                                      },
                                      icon: const Icon(Icons.close),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    )
                  : Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                          child: Text(
                        "No image selected",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                    ),

              const SizedBox(height: 20),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: Size.fromHeight(50)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _addProduct();
                    }
                  },
                  child: Text("Add Product")),
            ]),
          ),
        ),
      ),
    );
  }
}
