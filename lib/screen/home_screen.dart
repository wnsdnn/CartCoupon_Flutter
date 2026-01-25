import 'package:cart_coupon/control/app.dart';
import 'package:cart_coupon/screen/layout/default_layout.dart';
import 'package:cart_coupon/screen/payment_screen.dart';
import 'package:cart_coupon/util/format.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// 상품 추가 함수
  void handelAddProduct(String id) {
    App.upsertCartItem(id);

    setState(() {});
  }

  /// 장바구니 바로가기 함수
  void handelMoveCart() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('상품 목록', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
      child: Column(children: [
        /// 상단 메뉴 리스트
        Expanded(child: SingleChildScrollView(
          child: Column(children: [
            ...App.productList.map((p) => Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Row(children: [
                  Container(
                    width: 120, height: 120,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: Image.asset('assets/images${p.imageUrl}'),
                  ),
                  SizedBox(width: 20),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    Text(p.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${PriceFormatter(p.price)}원'),
                    Text('재고: ${p.stock}'),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      ElevatedButton(
                        onPressed: () => handelAddProduct(p.id),
                        style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: Color(0xFF4ec0e9), shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)))),
                        child: Text('추가', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold))
                      ),
                    ])
                  ]))
                ])
            ))
          ]),
        )),
        /// 하단 버튼바
        if (App.cartList.length > 0)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFeeeeee),
                  blurRadius: 8,
                  spreadRadius: 0,
                  offset: Offset(0, -3),
                ),
              ],
            ),
            child: Row(children: [
              Expanded(child: Text('${PriceFormatter(App.getTotalPrice())}원', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              ElevatedButton(
                onPressed: handelMoveCart,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Color(0xFF4ec0e9),
                  padding: EdgeInsets.symmetric(horizontal: 36, vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)))
                ),
                child: Text('장바구니 보기', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ]),
          ),
      ]),
    );
  }
}
