import 'package:cart_coupon/control/app.dart';
import 'package:cart_coupon/screen/layout/default_layout.dart';
import 'package:cart_coupon/util/format.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  /// 수량 감소 함수
  void handelDecrement(String id) {
    App.decrementCountOrRemove(id);

    setState(() {});
  }

  /// 수량 추가 함수
  void handelIncrement(String id) {
    App.incrementCount(id);

    setState(() {});
  }

  /// 쿠폰 변경 함수
  void handelCouponChange(value) {
    App.selectCoupon = value!;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('장바구니', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
      child: Column(children: [
        Expanded(child: SingleChildScrollView(
          child: Column(children: [
            ...App.cartList.map((p) => Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Row(children: [
                  Container(
                    width: 120, height: 120,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: Image.asset('assets/images${p.product.imageUrl}'),
                  ),
                  SizedBox(width: 20),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    Text(p.product.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${PriceFormatter(p.product.price)}원'),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      GestureDetector(
                        onTap: () => handelDecrement(p.id),
                        child: Text('-', style: TextStyle(color: Color(0xFF4ec0e9), fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 16),
                      Text('${p.count}', style: TextStyle(color: Color(0xFF4ec0e9), fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 18),
                      GestureDetector(
                        onTap: () => handelIncrement(p.id),
                        child: Text('+', style: TextStyle(color: Color(0xFF4ec0e9), fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ])
                  ]))
                ])
            ))
          ]),
        )),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          color: Colors.white,
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('장바구니 금액', style: TextStyle(color: Color(0xFF999999))),
              Text('${PriceFormatter(App.getTotalPrice())}원', style: TextStyle(color: Color(0xFF999999))),
            ]),
            SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('쿠폰 할인가', style: TextStyle(color: Color(0xFF999999))),
              Text('${PriceFormatter(App.getDiscountAmountByCouponId())}원', style: TextStyle(color: Color(0xFF999999))),
            ]),
            SizedBox(height: 8),
            DropdownButton(
              isExpanded: true,
              value: App.selectCoupon,
              items: [
                ...App.couponList.map((e) => DropdownMenuItem<String>(
                  value: e.id,
                  child: Text(e.name),
                )),
              ],
              onChanged: handelCouponChange,
            ),
            SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('총액', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('${PriceFormatter(App.getTotalWithCoupon())}원', style: TextStyle(fontWeight: FontWeight.bold)),
            ]),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Color(0xFF4ec0e9),
                  padding: EdgeInsets.symmetric(horizontal: 36, vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)))
              ),
              child: Text('결제하기', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ]),
        ),
      ]),
    );
  }
}
