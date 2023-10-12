class Products {
  String? name;
  String? description;
  String? category;
  String? price;
  List<String?>? images;
  String? userId;
  List<String?>? favouritedBy;

  Products({
    this.name,
    this.description,
    this.category,
    this.price,
    this.images,
    this.userId,
    this.favouritedBy,
  });
  //Map to json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'images': images,
      'userId': userId,
      'favouritedBy': favouritedBy,
    };
  }
}
