class CouponModel {
  String id;
  String name;
  String discountType;
  int discountValue;
  int minOrderPrice;
  int? maxDiscountPrice;
  bool isActive;

  CouponModel({
    required this.id,
    required this.name,
    required this.discountType,
    required this.discountValue,
    required this.minOrderPrice,
    required this.maxDiscountPrice,
    required this.isActive
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      id: json['id'],
      name: json['name'],
      discountType: json['discountType'],
      discountValue: json['discountValue'],
      minOrderPrice: json['minOrderPrice'],
      maxDiscountPrice: json['maxDiscountPrice'],
      isActive: json['isActive']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'discountType': discountType,
      'discountValue': discountValue,
      'minOrderPrice': minOrderPrice,
      'maxDiscountPrice': maxDiscountPrice,
      'isActive': isActive,
    };
  }
}