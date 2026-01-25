import 'package:cart_coupon/model/product_model.dart';

class CartModel {
  String id;
  ProductModel product;
  int count;

  CartModel({
    required this.id,
    required this.product,
    required this.count
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        id: json['id'],
      product: json['product'],
        count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product,
      'count': count
    };
  }
}