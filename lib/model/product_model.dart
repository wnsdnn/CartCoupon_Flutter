class ProductModel {
  String id;
  String name;
  int price;
  int stock;
  String imageUrl;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
    required this.imageUrl
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        stock: json['stock'],
        imageUrl: json['imageUrl']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'stock': stock,
      'imageUrl': imageUrl
    };
  }
}