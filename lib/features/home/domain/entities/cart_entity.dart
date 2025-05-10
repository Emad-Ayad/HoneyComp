import 'package:honey_comp/features/home/domain/entities/cart_item_entity.dart';
import 'package:honey_comp/features/home/domain/entities/product_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartList;

  CartEntity({required this.cartList});

  addCartItem(CartItemEntity cartItemEntity) {
    cartList.add(cartItemEntity);
  }

  void removeCartItem(CartItemEntity cartItemEntity) {
    cartList.remove(cartItemEntity);
  }

  bool isExist(ProductEntity product) {
    for (var item in cartList) {
      if (item.productEntity == product) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity product) {
    for (var item in cartList) {
      if (item.productEntity == product) {
        return item;
      }
    }
    return CartItemEntity(productEntity: product, count: 1);
  }

  int getTotalPrice() {
    int totalPrice = 0;
    for (var item in cartList) {
      totalPrice += item.calculateTotalPrice().toInt();
    }
    return totalPrice;
  }
}
