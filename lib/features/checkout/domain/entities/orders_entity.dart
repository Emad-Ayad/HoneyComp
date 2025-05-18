import 'package:honey_comp/features/checkout/domain/entities/shipping_Address_entity.dart';
import 'package:honey_comp/features/home/domain/entities/cart_item_entity.dart';

class OrdersEntity {
  final List<CartItemEntity> cartItems;
  final bool payWithCash;
  final ShippingAddressEntity shippingAddressEntity;

  OrdersEntity(this.cartItems, this.payWithCash, this.shippingAddressEntity);
}
