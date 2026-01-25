import 'package:cart_coupon/model/cart_model.dart';
import 'package:cart_coupon/model/coupon_model.dart';
import 'package:cart_coupon/model/product_model.dart';

class App {
  static List<ProductModel> productList = [];
  static List<CouponModel> couponList = [];
  static List<CartModel> cartList = [];

  static String selectCoupon = 'c000';

  /// 장바구니에 상품 추가 함수
  static upsertCartItem(String id) {
    final index = cartList.indexWhere((e) => e.id == id);

    if (index >= 0) {
      cartList[index].count += 1;
    } else {
      final product = productList.firstWhere((p) => p.id == id);

      cartList.add(CartModel(id: id, product: product, count: 1));
    }
  }

  /// 장바구니에 상품 수량 추가
  static incrementCount(String id) {
    final index = cartList.indexWhere((e) => e.id == id);

    cartList[index].count += 1;
  }

  /// 장바구니에 상품 수량 삭제(수량이 0인경우 삭제)
  static decrementCountOrRemove(String id) {
    final index = cartList.indexWhere((e) => e.id == id);

    final item = cartList[index];
    item.count -= 1;

    if (item.count <= 0) {
      cartList.removeAt(index);
    }
  }

  /// 쿠폰 할인가를 구하는 함수
  static int getDiscountAmountByCouponId() {
    final coupon = couponList.firstWhere((c) => c.id == selectCoupon);
    final price = getTotalPrice();
    final percent = coupon.discountValue;
    // 할인액 = price * percent / 100 (원 단위 int로 내림)
    final discountAmount = (price * percent) ~/ 100;

    return discountAmount.clamp(0, price);
  }

  /// 장바구니 상품들의 총액을 구하는 함수
  static getTotalPrice() {
    return cartList.fold<int>(
      0, (sum, item) => sum + (item.product.price * item.count),
    );
  }

  /// 결제 총액을 구하는 함수
  static getTotalWithCoupon() {
    return getTotalPrice() - getDiscountAmountByCouponId();
  }
}