import 'dart:convert';

import 'package:cart_coupon/control/app.dart';
import 'package:cart_coupon/model/coupon_model.dart';
import 'package:cart_coupon/model/product_model.dart';
import 'package:cart_coupon/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();

  final jsonString = await rootBundle.loadString('assets/data/data.json');
  final result = jsonDecode(jsonString);

  App.productList = result['products'].map<ProductModel>((json) => ProductModel.fromJson(json)).toList();
  App.couponList = result['coupons'].map<CouponModel>((json) => CouponModel.fromJson(json)).toList();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}